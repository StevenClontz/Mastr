class F6(MastrExercise):
  @classmethod
  def title(self):
    return "F6: Exact ODEs" 

  def generate(self):
    t = var("t")
    y = var("y") 
    
    # f=fs0+fs1+fs2
    fs = [
      randrange(1,6)*choice([-1,1])*t^randrange(2,5),
      randrange(1,6)*choice([-1,1])*y^randrange(2,5),
      randrange(1,6)*choice([-1,1])*t*y,
      randrange(1,6)*choice([-1,1])*t*y^2,
      randrange(1,6)*choice([-1,1])*t^2*y,
      randrange(1,6)*choice([-1,1])*t^2*y^2
    ]
    shuffle(fs)
    f = fs[0]+fs[1]+fs[2]
    # get distractors
    g = fs[0]+fs[2]+fs[4]
    h = fs[1]+fs[3]+fs[5]
    # pick initial values
    ivs = [-1,0,1]
    shuffle(ivs)
    t0 = ivs[0] 
    y0 = ivs[1] 
    f0 = f(t=t0,y=y0)
    odes = [
      "("+ latex(f.diff(t))+
      ")+("+latex(f.diff(y))+")y'=0",
      "("+ latex(g.diff(t))+
      ")+("+latex(h.diff(y))+")y'=0",
    ]
    exact_ode = odes[0] 
    shuffle(odes)
   
    return { 
      "ode0": odes[0],
      "ode1": odes[1],
      "exact_ode": exact_ode,
      "iv": "y("+latex(t0)+")="+latex(y0),
      "solution": latex(f)+"="+latex(f0)
    }
