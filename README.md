# Mastr

Scripts for easily writing randomized math exercises
for use in practice and assessment.

## Authoring randomized exercises

(To be implemented:)

Exercises authored using the Mastr platform require two things:
a controller and a template.

- The **controller** is a
  script written in [SageMath](https://www.sagemath.org/)
  that generates the random elements of the exercise and
  exports these elements as [JSON](https://www.json.org/json-en.html).
- The **template** is a [PreTeXt `<exercise/>`](https://pretextbook.org)
  that uses the [Mustache engine](https://mustache.github.io/)
  to inject the randomized elements into the exercise from the exported JSON.


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
