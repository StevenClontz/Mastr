import sys,json

if len(sys.argv)<2:
  raise Exception("The path to the standard must be provided.")

exercise_path = sys.argv[1]
exercise_name = exercise_path.split("/")[-1]

def display_coeff(x):
  if x==1:
    return "+"
  return ("+" if x > -1 else "") + str(x)

class MastrExercise:
  def __init__(self,seed):
    self.export = self.generate()
    if not isinstance(self.export,dict):
      raise Exception("genereate method must return dict")
    self.export["_seed"]=int(seed)
  def generate():
    return {}
  def export_to_json(self):
    json_str = json.dumps(self.export)
    print(json_str)

load(exercise_path+".sage")
exercise = eval(exercise_name)

seeds = [1234,123,12345,12,1]# sample(xrange(1000000),5)

for seed in seeds:
  set_random_seed(seed)
  exercise(seed).export_to_json()
