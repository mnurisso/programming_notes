# IDL - PLUTO

## PLOAD

Can read .dbl , .flt , .vtk , .dbl.h5 , .flt.h5 or .hdf5 formats. It requires also grid.out , dbl.out , flt.out, where one is the grid definition, the other one depends on the format chosen for the visualisation. 

```idl
PLOAD, 10, /VTK, VAR="bx1", dir="Data/";
```

Four common blocks are initialized when PLOAD is called:

- PLUTO_GRID: grid info number of points (nx1,nx2,nx3), coordinates (x1,x2,x3) and mesh spacing (dx1, dx2, dx3)
- PLUTO_VAR: NVAR and variables with the same name that they've in PLUTO
- PLUTO_RUN: t, dt, nlast
- PLUTO_USERDEF: optional block that can contain user-def variables. They've to be introduced with MATCH_USERDEF_VARNAME to manually add them. A userdef.pro file has to be added in the local working directory 

```idl
COMMON PLUTO_USERDEF, flag, vort; Define the common block

PRO MATCH_USERDEF_VARNAME, vpt, name, silent=silent
	COMMON PLUTO_GRID
	COMMON PLUTO_VAR
	COMMON PLUTO_RUN
	COMMON PLUTO_USERDEF

	CASE name OF
		"flag": BEGIN flag = vpt & PRINT,"> Reading ",name & END
		"vort": BEGIN vort = vpt & PRINT,"> Reading ",name & END
	ELSE:
	ENDCASE

	vpt = 0; Free memory
END
```

The example will add flag and vort variables so that PLOAD will be able to ream them. Both userdef.pro and pload.pro must be compiled first:

```idl
.r pload
.r userdef
```

## DISPLAY

```idl
DISPLAY,x1=x1,x2=x2,alog10(rho), title=’Density’,/vbar
```

PLUTO variables can be used in simple evaluation before being plotted

```idl
DISPLAY,x1=x1,x2=x2,/VBAR,title='Magnetic Field',bx1^2+bx2^2
```

## VECFIELD

Produces a 2D velocity field plot.

```idl
VECFIELD,bx1,bx2,x1,x2,/OVERPLOT,col=120
```

## Save file 

The GET_FRAME routine allows to save a window's content to an image file.

```idl
GET_FRAME, name = "rho", /jpg
```

## Particles

### PARTICLES_LOAD

Load Particles file:

```idl
PARTICLES_LOAD,10,/VTK
```

Without any specification the .dbl file is loaded. It's the only one with the energy specifics.

The fields available for the particles are:

```idl
Field_names:   id x1 x2 x3 vx1 vx2 vx3 tinj color density nmicro cmp_ratio
               shkflag shk_gradp cr vL vR eng chi
```

### PRINT

Allows to print single data value from a specific particles

```idl
PRINT,particles[4].vx1
```

### PARTICLES_OPLOT

Overlay point particles on a preexisting 2D plot.

```idl
PLOAD, 10                    ; Load fluid data file (in .dbl format)
DISPLAY,rho, x1=x1, x2=x2    ; Display density
PARTICLES_LOAD, 10           ; Load particle data file (int .dbl format)
PARTICLES_OPLOT, particles   ; Overlay particles on the plot generated
                             ; by previous DISPLAY call.
```

## Tools

### PCURL, PGRAD, PDIV

```idl
J = PCURL(Bx1,Bx2,Bx3)
```

## PLOT

```idl
x = particles[0].eng
y = particles[0].chi

PLOT,x,y,/XLOG,/YLOG, $        ;$ to go to a next line with the same line of code
     TITLE='Particles spectrum'
```

### Title and Axis

Labels can be set with:

```idl
TITLE='title'
XTITLE='xtitle'
YTITLE='ytitle'
```

Dimensions of the labels are set by:

```idl
CHARSIZE=2.0
XCHARTSIZE=3.0 ;if you want to specify only a specific label to be modified
```

where the number identifies the multiplication factor with respect to the standard size.

### Plot Range

```idl
XRANGE = [xmin,xmax]
```

### Background and line colors plot

IDL uses the 24-bit color value map. To produce a black plot with a white background:

```idl
BACKGROUND=255, COLOR=0
```

### OPLOT

Plot can be show on the same figure by using the `OPLOT` function:

```idl
PLOT,x,y,BACKGROUNG=255,COLOR=0
OPLOT,j,k,COLOR=0
```

### Color table

We first setup:

```idl
DEVICE,TRUE_COLOR=24,DECOMPOSED=0
```

Then we can load a color table, for example rainbow+white

```idl
;Load color table rainbow+white
LOADCT,39
red = COLOR=230
green = COLOR=150
blue = COLOR=50
```

