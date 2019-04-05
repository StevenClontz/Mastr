class D3m(MastrExercise):
  @classmethod
  def title(self):
    return "D3m: Non-smooth motion. Model and analyze motion involving instantaneous acceleration."

  def generate(self):
    '''
    Produces
    Mv'=Fu(t-t_s)-Fu(t-t_s-t_b) v(0)=v_0
    which solves to
    v=v_0+(F/M)(t-t_s)
    when t_s<t<t_s+t_b and
    v=v_0+(F/M)t_b
    when t>t_b.
    '''
    v_0 = 10*randrange(1,21)
    m = 100*randrange(1,51)
    f = 10*randrange(1,11)
    k = randrange(2,5)
    t_b = m*k
    t_s = m*randrange(0,21)
    t_q = t_s+m*randrange(1,2*k+1)
    vp = var("vp",latex_name="v'")
    v = var("v",latex_name="v")
    t = var("t",latex_name="t")
    u = function("u",latex_name="u")
    sol = v_0 + (f/m)*(t-t_s)*u(t-t_s) - (f/m)*(t-t_s-t_b)*u(t-t_s-t_b)
    if t_q<t_s+t_b:
       v_q = v_0+(f/m)*(t_q-t_s)
    else:
       v_q = v_0+(f/m)*t_b
   
    return { 
      "v_0": latex(v_0),
      "m": latex(m),
      "f": latex(f),
      "t_s": latex(t_s),
      "t_b": latex(t_b),
      "t_q": latex(t_q), 
      "ode": latex(m*vp==f*u(t-t_s)-f*u(t-t_s-t_b)), 
      "iv": "v(0)="+latex(v_0), 
      "v_q": latex(v_q),
      "sol": latex(v==sol)
    }
