# Mastr

Scripts for easily writing randomized math exercises
for use in practice and assessment.

## mastr.sage

```
sage mastr.sage PATH_TO_SCRIPT/name PATH_TO_BUILD [random]
```

Based on the script `PATH_TO_SCRIPT/name.sage`,
this will create the file `PATH_TO_BUILD/name/seeds.json` that
contains all the randomized elements of the math exercise.
This includes seeds from `0` to `999` inclusive.
By default these seeds are fixed (so the result of running this
script will be the same every time unless the underlying exercise
generation is changed), but by including the `random` command
(without brackets) at the end, the results will be different
each time the script is run.

## mastr.rb

```
ruby mastr.rb PATH_TO_SCRIPT/name PATH_TO_BUILD
```

Reads `PATH_TO_BUILD/name/seeds.json` and uses the template at
`PATH_TO_SCRIPT/name.xml.erb` to produce

- PreTeXt: `PATH_TO_BUILD/name/000.xml`
- LaTeX: `PATH_TO_BUILD/name/000.tex`
- HTML: `PATH_TO_BUILD/name/000.html`

for `000` through `999`.
