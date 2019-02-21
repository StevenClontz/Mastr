class F4(MastrExercise):
  @classmethod
  def title(self):
    return "F4: Autonomous ODEs"

  def generate(self):
    x = var("x")
    
    # pick a,b for x'=k*t^p(t-a)(t-b)
    k = choice([-1,1])
    p = randrange(4)
    a = randrange(-6,-1)
    b = randrange(2,7)
    f = k*x^p*(x-a)*(x-b)
    if f(x=a-1)>0:
      a_label = "sink/stable"
    else:
      a_label = "source/unstable"
    if f(x=b+1)<0:
      b_label = "sink/stable"
    else:
      b_label = "source/unstable"
    if p == 0:
      z_label = "N/A"
    elif p == 2:
      z_label = "neither/unstable"
    elif f(x=1)<0:
      z_label = "sink/stable"
    else:
      z_label = "source/unstable"
    # pick initial value
    if randrange(2) == 0:
      t0 = randrange(a+1,0)+choice([-0.2,-0.1,0.1,0.2])
      x0 = randrange(1,b)+choice([-0.2,-0.1,0.1,0.2])
      if f(x=x0)>0:
        lim = b
      elif p!=0:
        lim = 0
      else:
        lim = a
    else:
      x0 = randrange(a+1,0)+choice([-0.2,-0.1,0.1,0.2])
      t0 = randrange(1,b)+choice([-0.2,-0.1,0.1,0.2])
      if f(x=x0)<0:
        lim = a
      elif p!=0:
        lim = 0
      else:
        lim = b
   
    return {
      "ode":
        "x'=" +
        latex(f.expand()),
      "initial_condition": 
        "x("+latex(t0.n(digits=1))+")="+
        latex(x0.n(digits=1)),
      "a": latex(a),
      "b": latex(b),
      "a_label": a_label,
      "b_label": b_label,
      "z_label": z_label,
      "lim": latex(lim)
    } 
