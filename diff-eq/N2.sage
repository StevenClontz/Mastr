class N2(MastrExercise):
  @classmethod
  def title(cls):
    return "N2 - Euler’s method for IVP systems. Estimate the value of an IVP system solution using Euler’s method."
  @classmethod
  def gen_ode(cls,t,x,y):
    coeffs = [
      randrange(1,5)*choice([-1,1]),
      randrange(1,5)*choice([-1,1]),
      randrange(1,5)*choice([-1,1])
    ]
    coeffs[choice([0,1,2])]=0
    return coeffs[0]*t^randrange(1,3)*x^randrange(1,3) + \
      coeffs[1]*t^randrange(1,3)*y^randrange(1,3) + \
      coeffs[2]*x^randrange(1,3)*y^randrange(1,3) + randrange(-3,4)
  

  def generate(self):
    """
    Generates
    x' = _t^_x^_+_t^_y^_+_x^_y^_+_
    y' = _t^_x^_+_t^_y^_+_x^_y^_+_
    with one term zeroed, and asks for
    x,y at t=t_0+3h for h=0.1 or 0.2
    """
    reroll=True
    while reroll:
      t=var('t')
      x=var('x')
      y=var('y')
      xp=self.gen_ode(t,x,y)
      yp=self.gen_ode(t,x,y)
      t_0=randrange(-2,3)
      x_0=randrange(-2,3)
      y_0=randrange(-2,3)
      h=choice([1/10,1/5])
      t_n,x_n,y_n=t_0,x_0,y_0
      for i in range(3):
        t_n,x_n,y_n = t_n+h, \
          x_n+h*xp(t=t_n,x=x_n,y=y_n), \
          y_n+h*yp(t=t_n,x=x_n,y=y_n)
      if x_n.abs() < 100 and x_n.abs() > 1/100 and y_n.abs() < 100 and y_n.abs() > 1/100:
        reroll=False
 
    return {
      "xode": "x'="+latex(xp),
      "yode": "y'="+latex(yp),
      "xiv": "x("+latex(t_0)+")="+latex(x_0),
      "yiv": "y("+latex(t_0)+")="+latex(y_0),
      "h": latex(h.n(digits=2)),
      "t_n": latex(t_n.n(digits=2)),
      "x_n": latex(x_n.n(digits=4)),
      "y_n": latex(y_n.n(digits=4)),
    }
