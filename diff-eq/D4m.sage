class D4m(MastrExercise):
  @classmethod
  def title(self):
    return "D4m: Mass-spring impulse. Model and analyze motion of a mass-spring system involving an impulse."

  def generate(self):
    '''
    Produces
    mx''+kx=-i\delta(t-t_h)
    which solves to
    x=x_0cos(\sqrt{k/m}t)-(i/\sqrt{km})sin(\sqrt{k/m}(t-t_h))u(t-t_h)
    '''
    m = randrange(2,6)
    k=m*randrange(2,5)^2
    i = randrange(2,9)
    x_0 = randrange(1,11)
    t_h = randrange(1,11)
    t_q = t_h + randrange(1,11)
    xpp = var("_xpp",latex_name="x''")
    x = var("x",latex_name="x")
    t = var("t",latex_name="t")
    delta = function("delta",latex_name="\\delta")
    u = function("u",latex_name="u")
    ode = latex(m*xpp+k*x==-i*delta(t-t_h))
    sol= x_0*cos(sqrt(k/m)*t)-(i/sqrt(k*m))*sin(sqrt(k/m)*(t-t_h))
    sol_presentation = x_0*cos(sqrt(k/m)*t)-(i/sqrt(k*m))*sin(sqrt(k/m)*(t-t_h))*u(t-t_h)
   
    return { 
      "m": latex(m),
      "k": latex(k),
      "i": latex(i),
      "x_0": latex(x_0),
      "t_h": latex(t_h), 
      "t_q": latex(t_q), 
      "ode": ode,
      "x_q": latex(sol(t=t_q).n(digits=4)),
      "sol": latex(x==sol_presentation)
    }
