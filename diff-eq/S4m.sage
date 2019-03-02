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
      if unscaled_intersection==[2,5]:
        isocline_xin = (scale*40-10*x-4*y)
        isocline_xout = (scale*50-5*x-12*y)
      elif unscaled_intersection==[3,4]:
        isocline_xin = (scale*50-10*x-5*y)
        isocline_xout = (scale*54-6*x-9*y)
      elif unscaled_intersection==[5,6]:
        isocline_xin = (scale*120-12*x-10*y)
        isocline_xout = (scale*160-8*x-20*y)
      axis_equil=choice(["inside","outside"])
      if axis_equil=="inside":
        dxdt=x*isocline_xin/1000
        dydt=y*isocline_xout/1000
      else:
        dxdt=x*isocline_xout/1000
        dydt=y*isocline_xin/1000
   
    return { 
      "x_fish": x_fish["name"],
      "y_fish": y_fish["name"],
      "dxdt": "\\frac{d"+latex(x)+"}{dt}="+\
        latex(dxdt.expand().n(digits=4)),
      "dydt": "\\frac{d"+latex(y)+"}{dt}="+\
        latex(dydt.expand()),
    }
