class S3(MastrExercise):
  @classmethod
  def title(self):
    return "S3: Phase planes"

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
    dydt = choice([-1,1])*(dydt_rise*(x-x_int)-dydt_run*(y-y_int))
    if choice([True,False]):
      dxdt,dydt = dydt,dxdt 
   
    return { 
      "dxdt": "x'="+latex(dxdt.expand()),
      "dydt": "y'="+latex(dydt.expand()),
    }
