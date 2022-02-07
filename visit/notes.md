# Visit

## Plot Attributes

Can change log scale, pacity, min,max values and other things.

## Operator

Can slice, put threshold or similar to a plot. If this operator needs to be applied only to one part of the plot, you have to unset `Apply operators to all plots`.

## Interaction mode

![Basics-InteractionModes](/home/matteo/Sissa/advanced_programming_2019-20/visit/Basics-InteractionModes.png)

`Lineout` allows you to create a plot of a scalar variable along a user-def line. Can be used multiple times on different lines in order to compare different behaviours.

Exact lineout and 3D ones can be created with `Lineout` in the queries menu.

## Save image

`File->Save window` will save the actual window on the working folder.

## Queries

Are the main mechanism to do data analysis.

- **Variable-related**: it can be done on actual data to consider only slices of the original data-set.
- **Mesh-related**
- **Queries over Time**: analysis can be done through time and generate a time-curve.

## Expressions

Create new mesh variables from existing ones. They have to be defined over the entire mesh. If you want to define something that is define as a single quantity, like for example an integrated quantity, then queries is what you should use.

The `Type` of the variable is automatically a scalar mesh, so if the variable that we're creating has a different type it has to be specified.

Some of the expressions supported are: `+, -, /, \*, bitwise-^, bitwise-&, sqrt(), abs(), ciel(), floor(), ln(), log10(), exp()`

### Coordinates

Use function `Coords()` in the Mesh section of the functions to create a vector variable, then coordinates can be defined as components of this vector as scalar variables.

### Vectors

`{vx1,vx2}` where `vx1` and `vx2` are scalar mesh quantities will create a vector mesh quantity that can be then plotted using field lines.

## Command Line Interface (Python 2.7)

To run visit in batch mode:

```bash
visit -nowin -cli -s <script.py>
```

### Example

```python
# Clear any previous plots
DeleteAllPlots()
# Create a plot of the scalar field 'temp'
AddPlot("Pseudocolor","temp")
# Slice the volume to show only three
# external faces.
AddOperator("ThreeSlice")
tatts = ThreeSliceAttributes()
tatts.x = -10
tatts.y = -10
tatts.z = -10
SetOperatorOptions(tatts)
DrawPlots()
# Find the maximum value of the field 'temp'
Query("Max")
val = GetQueryOutputValue()
print "Max value of 'temp' = ", val

# Create a streamline plot that follows
# the gradient of 'temp'
DefineVectorExpression("g","gradient(temp)")
AddPlot("Pseudocolor", "operators/IntegralCurve/g")
iatts = IntegralCurveAttributes()
iatts.sourceType = iatts.SpecifiedBox
iatts.sampleDensity0 = 7
iatts.sampleDensity1 = 7
iatts.sampleDensity2 = 7
iatts.dataValue = iatts.SeedPointID
iatts.integrationType = iatts.DormandPrince
iatts.issueStiffnessWarnings = 0
iatts.issueCriticalPointsWarnings = 0
SetOperatorOptions(iatts)

# set style of streamlines
patts = PseudocolorAttributes()
patts.lineType = patts.Tube
patts.tailStyle = patts.Spheres
patts.headStyle = patts.Cones
patts.endPointRadiusBBox = 0.01
SetPlotOptions(patts)

DrawPlots()
```

## Create a movie

[Tutorial](https://visit-sphinx-github-user-manual.readthedocs.io/en/develop/tutorials/MakingMovies.html)