class C7m(MastrExercise):
  @classmethod
  def title(cls):
    return "C7m - Mass-spring systems. Model and analyze mechanical oscillators with a second-order IVP."

  def generate(self):
    #ODE M^2x''+K^2x=0 solves to c_1cos(Kt/M)+c_2sin(Kt/M)
    mass_root = randrange(2,6) #M
    spring_k_root = mass_root #K
    while spring_k_root == mass_root:
      spring_k_root = randrange(2,6)
    #releasing from rest gives c_2=0, c_1=initial displacement
    initial_displacement = randrange(2,6)*choice([-1,1])
    if initial_displacement > 0:
      stretch_compress = "stretch"
    else:
      stretch_compress = "compress"
    initial_force = -spring_k_root^2*initial_displacement
     
    elapsed_time = randrange(10,99)/10 # in s
    elapsed_position = initial_displacement*\
      cos(spring_k_root*elapsed_time/mass_root)
    if elapsed_position > 0:
      outward_inward = "outward"
    else:
      outward_inward = "inward"
 
    return {
      "mass": latex(mass_root^2),
      "spring_k": latex(spring_k_root^2),
      "initial_force_abs": latex(initial_force.abs()),
      "stretch_compress": stretch_compress,
      "initial_displacement": latex(initial_displacement),
      "initial_displacement_abs": latex(initial_displacement.abs()),
      "elapsed_time": latex(elapsed_time.n(digits=2)), 
      "elapsed_position_abs": latex(elapsed_position.abs().n(digits=3)), 
      "outward_inward": outward_inward
    }
