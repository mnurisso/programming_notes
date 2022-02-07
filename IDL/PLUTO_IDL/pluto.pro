PLOAD, 0
PARTICLES_LOAD, 0

x = particles[0].eng
y = particles[0].chi

;PLOT,x,y,/XLOG,/YLOG

PLOT,x,y,/XLOG,/YLOG,TITLE='Partiles spectrum',$
    XTITLE='E',YTITLE='chi',XRANGE=[0.01,1.],$
		YRANGE=[0.01,100],BACKGROUND = 255,$
		COLOR = 0,CHARSIZE=2.0
