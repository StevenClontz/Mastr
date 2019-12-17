import sys,json,os

if len(sys.argv)<2:
  raise Exception("The path to the standard must be provided.")

exercise_path = sys.argv[1]
exercise_name = exercise_path.split("/")[-1]

if len(sys.argv)==3:
  build_path = sys.argv[2]
  if build_path[-1] != '/':
    build_path = build_path + '/'
  build_path = build_path+exercise_name
else:
  build_path = 'build/'+exercise_path
print('building to'+build_path)

def display_coeff(x):
  if x==1:
    return "+"
  return ("+" if x > -1 else "") + str(x)

class MastrExercise:
  @classmethod
  def title(cls):
    return "Untitled exercise" 

  def __init__(self,seed):
    self.export = self.generate()
    if not isinstance(self.export,dict):
      raise Exception("genereate method must return dict")
    self.export["_seed"]=int(seed)
  def generate(self):
    return {}
  def to_json(self):
    return json.dumps(self.export)

load(exercise_path+".sage")
Exercise = eval(exercise_name)

seed_ints = xrange(1,101)

seeds = {
  "title": Exercise.title(),
  "seeds": []
}

for seed_int in seed_ints:
  set_random_seed(seed_int)
  seeds["seeds"].append(Exercise(seed_int).export)

# Create directory based on path if necessary
# https://stackoverflow.com/a/14364249
try: 
  os.makedirs(build_path)
except OSError:
  if not os.path.isdir(build_path):
    raise

# Create file
with open(build_path+'/seeds.json', 'w') as outfile:
  outfile.write(json.dumps(seeds))
