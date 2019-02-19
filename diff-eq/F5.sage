class F5(MastrExercise):
  @classmethod
  def title(self):
    return "F5: First order linear IVP" 

  def generate(self):
    t = var("t")
    
    # pick n for y=kx^n
    n = randrange(2,6)*choice([-1,1])
    # pick initial value
    t0 = choice([-1,1])
    # pick coefficient
    k = randrange(1,5)*choice([-1,1])
    y = k*t^n
    # particular solution
    kp = randrange(1,6)*choice([-1,1])
    m = n
    while m==n:
      m = randrange(1,5)*choice([-1,1])
    part_sol = choice([
      kp*t^m
    ]) 
   
    return { 
      "ivp":
        latex(n*part_sol-t*part_sol.diff())+
        "+ty'="+
        latex(n) +
        "y \hspace{1em} y(" +
        latex(t0) +
        ") = " +
        latex(y(t=t0)+part_sol(t=t0)),
      "ivp_sol":
        "y="+ latex(k) +"t^{"+latex(n) + "}" + 
        display_coeff(kp) + latex(part_sol/kp)
    }
