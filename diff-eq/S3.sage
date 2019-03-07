class S3(MastrExercise):
  @classmethod
  def title(self):
    return "S3: Phase planes"

  @classmethod
  def cardinal(self,dxdt,dydt,x,y):
    direction = ""
    if dydt(x=x,y=y)>0:
      direction += "north"
    elif dydt(x=x,y=y)<0:
      direction += "south"
    if dxdt(x=x,y=y)>0:
      direction += "east"
    elif dxdt(x=x,y=y)<0:
      direction += "west"
    return direction

  def generate(self):
    '''
    A simple ODE system with two linear isoclines that intersect
    at a lattice point.
    '''
    x_int = randrange(-5,6)
    y_int = randrange(-5,6)
    dxdt_rise_sign = choice([-1,1])
    dxdt_rise = dxdt_rise_sign*randrange(1,6)
    dxdt_run = randrange(1,6)
    dydt_rise = -dxdt_rise_sign*randrange(1,6) 
    dydt_run = randrange(1,6)
    x = var("x")
    y = var("y")
    dxdt = dxdt_rise*(x-x_int)-dxdt_run*(y-y_int)
    if dxdt_rise_sign>0:
       dxdt_slope = "positive"
       dydt_slope = "negative"
    else:
       dydt_slope = "positive"
       dxdt_slope = "negative"
    dydt = choice([-1,1])*(dydt_rise*(x-x_int)-dydt_run*(y-y_int))
    if choice([True,False]):
      dxdt,dydt = dydt,dxdt
      dxdt_slope,dydt_slope = dydt_slope,dxdt_slope
   
    return { 
      "dxdt": "x'="+latex(dxdt.expand()),
      "dydt": "y'="+latex(dydt.expand()),
      "intersection": "("+latex(x_int)+","+latex(y_int)+")",
      "dxdt_slope": dxdt_slope,
      "dydt_slope": dydt_slope,
      "top_arrows": self.cardinal(dxdt,dydt,x_int,y_int+1),
      "bottom_arrows": self.cardinal(dxdt,dydt,x_int,y_int-1),
      "right_arrows": self.cardinal(dxdt,dydt,x_int+1,y_int),
      "left_arrows": self.cardinal(dxdt,dydt,x_int-1,y_int),
    }
