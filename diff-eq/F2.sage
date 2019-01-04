class F2(MastrExercise):
  @classmethod
  def title(self):
    return "F2: Separation of variables"

  def generate(self):
    t = var("t")
    
    # pick n for y=kx^n
    n = randrange(2,4)*choice([-1,1])
    # pick initial value
    t0 = randrange(1,5)*choice([-1,1])
    # pick coefficient
    k = randrange(1,5)*choice([-1,1])
    y = k*t^n
   
    return { 
      "ivp":
        "xy'=" +
        latex(n) +
        "y \hspace{1em} y(" +
        latex(t0) +
        ") = " +
        latex(y(t=t0)),
      "ivp_sol":
        "y="+ latex(k) +"t^"+latex(n)
    }
