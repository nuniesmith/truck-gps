"""Draw the default v0.5 packing dimensions (schematic, not a mesh render).
Update the drawing if CAD parameters change. Requires NumPy and Matplotlib.
"""
from pathlib import Path
import numpy as np
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from matplotlib.patches import Rectangle, Circle, FancyBboxPatch, RegularPolygon

ROOT = Path(__file__).resolve().parent
CAD = ROOT
DT = np.dtype([('n','<f4',(3,)),('v','<f4',(3,3)),('a','<u2')])
S2 = 2**-.5
plt.rcParams.update({'font.family':'DejaVu Sans','font.size':11})
fig=plt.figure(figsize=(17,10.5),facecolor='#f5f7fa')
fig.text(.045,.95,'TRUCK GPS  /  v0.5',fontsize=24,fontweight='bold',color='#132a3b')
fig.text(.045,.918,'Electronics packing prototype • dimensions in mm • physical fit still to test',fontsize=13,color='#526375')

ax=fig.add_axes([.035,.195,.505,.675]);ax.set_facecolor('#f5f7fa');ax.set_aspect('equal')
from matplotlib.patches import Polygon
outline=np.array([[0,0],[0,98],[24.4,97],[24.4,88.1795],[50.8,87.4],[50.8,.5]])
ax.add_patch(Polygon(outline,closed=True,fc='white',ec='#8799a8',lw=1.6,ls='--'))
ax.add_patch(Rectangle((0,7.3),18,86.4,fc='#95c7d8',ec='#28799c',lw=1.5))
ax.add_patch(Rectangle((-6.6,6),6.3,2.5,fc='#536777',ec='none'))
ax.add_patch(Rectangle((-6.6,92.5),6.3,5.5,fc='#536777',ec='none'))
ax.plot([-6.6,-6.6],[8.5,92.5],color='#718a9a',lw=.8,ls=':')
ax.add_patch(Rectangle((-8,-3),8,4.5,fc='#718a9a',ec='none'))
ax.add_patch(Rectangle((48.4,6.6),2.4,79.6,fc='#718a9a',ec='none'))
ax.add_patch(Rectangle((24,42),22,40,fc='#dcc2a7',ec='#8c5a32',lw=1.6))
ax.text(35,62,'FAN',ha='center',va='center',rotation=90,weight='bold',fontsize=12,color='#654124')
ax.add_patch(Rectangle((20.6,39),3.4,46,fc='#c7d9e5',ec='#28799c',lw=.7))
ax.add_patch(Rectangle((21.6,41.2),2.4,41.8,fc='white',ec='none'))
ax.add_patch(Rectangle((20.6,83),3.75,12.5,fc='#c7d9e5',ec='#28799c',lw=.7))
ax.add_patch(Rectangle((21.6,83),1.8,12.0,fc='white',ec='none'))
ax.plot([0,23],[95.8,95.55],color='#28799c',lw=2)
def yz(s,z):return [-8-s*S2+z*S2,1.1-s*S2-z*S2]
ax.add_patch(Polygon([yz(0,0),yz(102,0),yz(102,4),yz(0,4)],fc='#718a9a',ec='#536777',lw=1))
ax.add_patch(Polygon([yz(34,6),yz(76,6),yz(76,25),yz(34,25)],fc='#d9e6de',ec='#347d5b',lw=1.5))
ax.text(-37,-46,'Power module',ha='center',rotation=45,fontsize=10,color='#205f42')
arrow={'arrowstyle':'-','color':'#667b8b','linewidth':1}
ax.annotate('GPS envelope\n18 mm trial thickness',xy=(9,76),xytext=(-78,82),ha='left',fontsize=11,color='#28799c',arrowprops=arrow)
ax.annotate('Removable\nfaceplate',xy=(-4,7.5),xytext=(-78,43),ha='left',fontsize=11,color='#425c70',arrowprops=arrow)
ax.annotate('Rear carrier',xy=(49.5,20),xytext=(19,-13),ha='left',fontsize=10,color='#526375',arrowprops=arrow)
ax.annotate('45° shelf',xy=yz(90,2),xytext=(-82,-80),ha='left',fontsize=11,color='#526375',arrowprops=arrow)
ax.annotate('',xy=(24,34),xytext=(46,34),arrowprops={'arrowstyle':'<->','color':'#8c5a32'})
ax.text(35,28,'22 mm with pads',ha='center',fontsize=9,color='#8c5a32')
ax.annotate('',xy=(0,106),xytext=(50.8,106),arrowprops={'arrowstyle':'<->','color':'#566b7a'})
ax.text(25.4,111,'50.8 mm cubby depth',ha='center',fontsize=10,color='#526375')
ax.set_xlim(-85,63);ax.set_ylim(-84,119);ax.axis('off')
fig.text(.055,.868,'Side section · fan / PopSocket side',fontsize=13,fontweight='bold',color='#203747')
fig.text(.052,.178,'Component envelopes and the selected mounting planes',fontsize=12,fontweight='bold',color='#203747')
fig.text(.052,.15,'The shallow air path needs a physical airflow and noise test.',fontsize=10.5,color='#526375')

b=fig.add_axes([.585,.40,.38,.445]);b.set_facecolor('#f5f7fa');b.set_aspect('equal')
b.add_patch(Rectangle((0,0),164.5,98,facecolor='#dbe2e9',edgecolor='#738596',lw=1.5))
b.add_patch(Rectangle((24,8),116.5,77,facecolor='#fff',edgecolor='#afbcc9',lw=1))
b.add_patch(Rectangle((27,42),40,40,facecolor='#dcc2a7',edgecolor='#8c5a32',lw=1.8))
b.add_patch(Circle((47,62),18.5,fill=False,edgecolor='#8c5a32',lw=1))
for x in [31,63]:
    for y in [46,78]:b.add_patch(Circle((x,y),1.1,fc='white',ec='#8c5a32',lw=.7))
b.text(47,63,'FAN',ha='center',va='center',weight='bold',fontsize=12,color='#54371f')
b.text(47,54,'40 × 40',ha='center',fontsize=10,color='#54371f')
b.add_patch(Rectangle((75,19),63,57,facecolor='#bfdccc',edgecolor='#347d5b',lw=1.8))
for x in [77.5,135.5]:
    for y in [21.5,73.5]:b.add_patch(Circle((x,y),1.1,fc='white',ec='#347d5b',lw=.7))
b.text(106.5,50,'PICO +',ha='center',weight='bold',color='#205f42')
b.text(106.5,43,'FREENOVE',ha='center',weight='bold',color='#205f42')
b.text(106.5,35,'63 × 57 PCB',ha='center',fontsize=10,color='#205f42')
b.add_patch(Rectangle((33,10),33,17,facecolor='#fff4c8',edgecolor='#ac8e28',ls='--'))
b.text(49.5,18,'USB elbow',ha='center',fontsize=9,color='#775d14')
b.text(49.5,13,'trial volume',ha='center',fontsize=8,color='#775d14')
for x in [13,151.5]:
    for y in [14,64]:b.add_patch(RegularPolygon((x,y),6,radius=10.8/(3**.5),orientation=np.pi/2,facecolor='#8797a8',edgecolor='#506477'))
for i in range(13):
    x=164.5/2-102/2+i*8
    b.add_patch(FancyBboxPatch((x,1.7),6,3.4,boxstyle='round,pad=0,rounding_size=1.7',fc='#475f73',ec='none'))
    if abs(x+3-106.45)>8:
        b.add_patch(FancyBboxPatch((x,95),6,1.6,boxstyle='round,pad=0,rounding_size=.8',fc='#297ba0',ec='none'))
b.add_patch(Rectangle((102.45,93.9),8,4.2,facecolor='#f5f7fa',edgecolor='none'))
b.annotate('Upper vents / mic clearance',xy=(108,98),xytext=(75,110),ha='center',fontsize=10,color='#28799c',arrowprops={'arrowstyle':'-','color':'#28799c'})
b.annotate('',xy=(0,-8),xytext=(164.5,-8),arrowprops={'arrowstyle':'<->','color':'#566b7a'})
b.text(82.25,-15,'164.5 mm unchanged front width',ha='center',fontsize=10,color='#526375')
b.set_xlim(-3,168);b.set_ylim(-18,116);b.axis('off')
fig.text(.588,.868,'Behind the GPS · viewed from the driver',fontsize=13,fontweight='bold',color='#203747')

fig.text(.60,.355,'REMOVABLE SHELF MODULES',fontsize=12,fontweight='bold',color='#203747')
fig.text(.60,.319,'PopSocket side: power module + blank USB-C panel',fontsize=11,color='#526375')
fig.text(.60,.289,'AirPods side: future Pi Zero 2 W + connector access',fontsize=11,color='#526375')
fig.text(.60,.239,'Fan pads: 22 mm depth     •     Fan screw pitch: 32 mm',fontsize=11,color='#526375')
fig.text(.60,.209,'Pico/breakout stack: 21 mm TRIAL envelope',fontsize=11,color='#946d1a')
fig.text(.60,.179,'ESR recess: Ø57.5 × 0.6 mm TRIAL — print coupon',fontsize=11,color='#946d1a')
fig.text(.045,.075,'Before the full print',fontsize=13,fontweight='bold',color='#203747')
fig.text(.045,.044,'Test bolt heads, M2 hardware, fan/pads, complete Pico stack, ESR ring + adhesive, angled cables and truck trim.',fontsize=12,color='#526375')
fig.savefig(CAD/'layout_preview.png',dpi=120,facecolor=fig.get_facecolor())
print(CAD/'layout_preview.png')
