"""Top views of actual exported meshes; requires NumPy and Matplotlib."""
from pathlib import Path
import numpy as np
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from matplotlib.collections import PolyCollection
from matplotlib.colors import Normalize
root=Path(__file__).resolve().parent
dtype=np.dtype([('n','<f4',(3,)),('v','<f4',(3,3)),('a','<u2')])
fig,axes=plt.subplots(2,2,figsize=(11,8),layout='constrained')
for ax,(name,title) in zip(axes.flat,[('front_frame','Front frame: 169.4 x 97.6 mm'),('side_gauge','Side gauge: rear top 79.5 mm'),('plan_gauge','Plan gauge: inherited depth/taper'),('airpods_charge_test','AirPods: pocket 64.8 x 24.8 mm')]):
    v=np.frombuffer((root/(name+'.stl')).read_bytes(),dtype=dtype,offset=84)['v'].astype(float)
    n=np.cross(v[:,1]-v[:,0],v[:,2]-v[:,0]); verts=v[n[:,2]>1e-8]
    z=verts[:,:,2].mean(axis=1); order=np.argsort(z)
    colors=plt.get_cmap('Blues')(Normalize(vmin=-max(z)*.6,vmax=max(z)*1.3)(z[order]))
    ax.add_collection(PolyCollection(verts[order,:,:2],facecolors=colors,edgecolors='none',antialiased=False))
    ax.autoscale();ax.margins(.06);ax.set_aspect('equal');ax.set_title(title,fontsize=11)
    ax.set_xlabel('mm');ax.set_ylabel('mm');ax.set_facecolor('#f3f5f7')
fig.suptitle('v0.6 fit checkpoint — top views of exported STLs',fontsize=15)
fig.savefig(root/'fit_preview.png',dpi=130)
