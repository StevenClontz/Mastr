class D2(MastrExercise):
  @classmethod
  def title(cls):
    return "D2 - Discontinuous IVPs. Use Laplace transforms to solve IVPs involving a step function or Dirac delta distribution."
  @classmethod
  def gen_delta(cls):
    """
    Generates a nice IVP involving \delta(t-a)
    """
    t = var("t")
    s = var("s")
    y = var("c_y",latex_name="y")
    yp = var("b_yp",latex_name="y'")
    ypp = var("a_ypp",latex_name="y''")
    d = function("delta",latex_name="\\delta")
    u = function("u")
    a = randrange(1,4)
    b = randrange(1,4)
    m = choice([-1,1])*randrange(1,5)
    n=m
    while n==m:
      n = choice([-1,1])*randrange(1,5)
    k=m*b^2
    y_0=choice([-1,1])*randrange(1,6)
    if randrange(0,2)==0:
      y_0=0
    else:
      n=0
    yp_0 = n*b
    ode = latex(ypp+b^2*y==k*u(t-a))
    ivs = "y(0)="+latex(y_0)+",y'(0)="+latex(yp_0)
    ly = "\\mathcal L\\left\\{y\\right\\}="+latex(\
      (y_0*s+yp_0)/(s^2+b^2)+k*exp(-a*s)/(s*(s^2+b^2)))
    ly_simp = "\\mathcal L\\left\\{y\\right\\}="+latex(\
      y_0*s/(s^2+b^2)+yp_0/(s^2+b^2)+m*exp(-a*s)/s-m*s*exp(-a*s)/(s^2+b^2))
    sol = latex(y==y_0*cos(b*t)+n*sin(b*t)+m*u(t-a)-m*cos(b*(t-a))*u(t-a))
 
    return {
      "ode": ode,
      "ivs": ivs,
      "ly": ly,
      "ly_simp": ly_simp,
      "sol": sol
    }

  @classmethod
  def gen_u(cls):
    """
    Generates a nice IVP involving u(t-a)
    """
    t = var("t")
    s = var("s")
    y = var("c_y",latex_name="y")
    yp = var("b_yp",latex_name="y'")
    ypp = var("a_ypp",latex_name="y''")
    d = function("delta",latex_name="\\delta")
    u = function("u")
    a = randrange(1,4)
    m = choice([-1,1])*randrange(1,5)
    n=m
    while n==m:
      n = choice([-1,1])*randrange(1,5)
    alpha = choice([-1,1])*randrange(1,5)
    beta = choice([-1,1])*randrange(1,5)
    k=alpha*(m-n)
    yp_0 = beta*(m-n)
    y_0=0
    b=-m-n
    c=m*n
    ode = latex(ypp+b*yp+c*y==k*d(t-a))
    ivs = "y(0)="+latex(y_0)+",y'(0)="+latex(yp_0)
    ly = "\\mathcal L\\left\\{y\\right\\}="+latex(\
      (y_0*s+yp_0)/(s^2+b*s+c)+k*exp(-a*s)/(s^2+b*s+c))
    ly_simp = "\\mathcal L\\left\\{y\\right\\}="+latex(\
      beta/(s-m)-beta/(s-n)+exp(-a*s)*alpha/(s-m)-exp(-a*s)*alpha/(s-n))
    sol = latex(y==beta*exp(m*t)-beta*exp(n*t)+alpha*exp(m*(t-a))*u(t-a)\
      -alpha*exp(n*(t-a))*u(t-a))
 
    return {
      "ode": ode,
      "ivs": ivs,
      "ly": ly,
      "ly_simp": ly_simp,
      "sol": sol
    }

  def generate(self):
    return choice([self.gen_delta(),self.gen_u()])
