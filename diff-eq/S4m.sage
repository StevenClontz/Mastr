class S4m(MastrExercise):
  @classmethod
  def title(self):
    return "S4m: Interacting populations" 

  def generate(self):
    '''
    We focus on three scenarios: isoclines cross in 1st quadrant,
    isoclines cross on an axis, or isoclines cross outside 1st quadrant.
    '''
    scale=choice([10,20,50])
    scenario = randrange(0,1)
    fish_choices = [
      {"name":"bluegill","var":"B"},
      {"name":"redfish","var":"R"},
      {"name":"greenfish","var":"G"},
      {"name":"purplegill","var":"P"},
      {"name":"yellowgill","var":"Y"},
      {"name":"magentafish","var":"M"},
    ]
    x_fish = choice(fish_choices)
    y_fish = x_fish
    while y_fish == x_fish:
      y_fish = choice(fish_choices)
    x = var(x_fish["var"])
    y = var(y_fish["var"])
    if scenario == 0:
      unscaled_intersection=choice([[2,5],[3,4],[5,6]])
      middle_equil = [scale*i for i in unscaled_intersection]
      axis_equil=choice(["inside","outside"])
      equils = [[0,0],middle_equil]
      if unscaled_intersection==[2,5]:
        isocline_xin = (scale*40-10*x-4*y)
        isocline_xout = (scale*72-6*x-12*y)
        x_init = scale*5+randrange(-2,3)
        y_init = scale*2+randrange(-2,3)
        if axis_equil=="inside":
          equils.append([scale*4,0])
          equils.append([0,scale*5])
        else:
          equils.append([scale*12,0])
          equils.append([0,scale*10])
      elif unscaled_intersection==[3,4]:
        isocline_xin = (scale*50-10*x-5*y)
        isocline_xout = (scale*54-6*x-9*y)
        x_init = scale*6+randrange(-2,3)
        y_init = scale*1+randrange(-2,3)
        if axis_equil=="inside":
          equils.append([scale*5,0])
          equils.append([0,scale*6])
        else:
          equils.append([scale*9,0])
          equils.append([0,scale*10])
      elif unscaled_intersection==[5,6]:
        isocline_xin = (scale*120-12*x-10*y)
        isocline_xout = (scale*160-8*x-20*y)
        x_init = scale*12+randrange(-2,3)
        y_init = scale*2+randrange(-2,3)
        if axis_equil=="inside":
          equils.append([scale*10,0])
          equils.append([0,scale*8])
        else:
          equils.append([scale*20,0])
          equils.append([0,scale*12])
      if axis_equil=="inside":
        dxdt=x*isocline_xin/1000
        dydt=y*isocline_xout/1000
        long_term = "both species will co-exist"
      else:
        dxdt=x*isocline_xout/1000
        dydt=y*isocline_xin/1000
        long_term = "only " + x_fish["name"] + " will survive"
    equils_print = "The equilibria of the phase plane "+\
      "are given by <me>("+latex(x)+","+latex(y)+\
      ")\in\\left\\{"
    for equil in equils:
      equils_print+="("+latex(equil[0])+\
        ","+latex(equil[1])+"),"
    equils_print = equils_print[:-1]+"\\right\}</me>"
   
    return { 
      "x_fish": x_fish["name"],
      "y_fish": y_fish["name"],
      "dxdt": "\\frac{d"+latex(x)+"}{dt}="+\
        latex(dxdt.expand()),
      "dydt": "\\frac{d"+latex(y)+"}{dt}="+\
        latex(dydt.expand()),
      "x_init": latex(x_init),
      "y_init": latex(y_init),
      "long_term": long_term, 
      "equils": equils_print,
    }
