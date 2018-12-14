import sys,json,os

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
    self.export["_title"]=self.title()
  def title(self):
    return "Untitled exercise" 
  def generate(self):
    return {}
  def to_json(self):
    return json.dumps(self.export)

load(exercise_path+".sage")
exercise = eval(exercise_name)

seeds = xrange(1,101)

seed_dict = {}

for seed in seeds:
  set_random_seed(seed)
  seed_dict[seed] = exercise(seed).export

# Create directory based on path if necessary
# https://stackoverflow.com/a/14364249
try: 
    os.makedirs(exercise_path)
except OSError:
    if not os.path.isdir(exercise_path):
        raise

# Create file
with open(exercise_path+'/seeds.json', 'w') as outfile:
  outfile.write(json.dumps(seed_dict))
