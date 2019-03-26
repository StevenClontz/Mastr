class N1(MastrExercise):
  @classmethod
  def title(cls):
    return "N1 - Existence and uniqueness. Apply an existence and uniqueness theorem to an IVP."

  def generate(self):
    """
    Generates
    (t-a)(t-(a+k))y'=(t-c)(t-d)y+f(t)
    with initial value out of
    L: y(a-j)=y_0
    M: y(a+j)=y_0
    R: y(a+k+j)=y_0
    """
    a = randrange(-5,2)
    k = randrange(2,6)
    c = randrange(-5,6)
    d = randrange(-5,6)
    case = choice(["L","M","R"])
    if case == "L":
      t_0 = a-randrange(1,5)
      interval = "(-\\infty,"+latex(a)+")"
    if case == "M":
      t_0 = a+randrange(1,k)
      interval = "("+latex(a)+","+latex(a+k)+")"
    if case == "R":
      t_0 = a+k+randrange(1,5)
      interval = "("+latex(a+k)+",\\infty)"
    y_0 = randrange(-5,6)
    t = var('t')   
    f = randrange(-3,4)*(t^randrange(1,4))
 
    return {
      "ode": "("+latex(((t-a)*(t-a-k)).expand())+\
        ")y'="+latex(((t-c)*(t-d)).expand()*var('y')+f),
      "iv": "y("+latex(t_0)+")="+latex(y_0),
      "interval": interval
    }
