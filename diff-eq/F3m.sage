class F3m(MastrExercise):
  @classmethod
  def title(cls):
    return "F3m - Motion with quadratic drag. Model and analyze the horizontal motion of an object with quadratic drag." 

  def generate(self):
    #IVP mv'=-bv^2 solves to v=1/(bt/m+1/v(0)) 
    mass = randrange(2,10) #m
    drag_coeff = (mass^2+10)/100 #b, chosen to not simplify
    initial_v = randrange(2,10) #v(0)
    initial_F = drag_coeff*initial_v^2 #-F(0)=bv(0)^2 
    elapsed_t = randrange(2,10) #t_0
    elapsed_v = 1/(drag_coeff*elapsed_t/mass+1/initial_v)
    return {
      "mass": latex(mass),
      "drag_coeff": latex(drag_coeff.n(digits=2)),
      "initial_v": latex(initial_v),
      "initial_F": latex(initial_F.n(digits=3)),
      "elapsed_t": latex(elapsed_t),
      "elapsed_v": latex(elapsed_v.n(digits=3))
    }
