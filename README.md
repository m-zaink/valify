# valify
---
<div>
<center>
<img src="https://gitlab.com/uploads/-/system/personal_snippet/2037052/ff80ba4c494c8887c0f4d18fc60b4c6d/Valify-Logo.png" width="250" height="250"/>
</center>
</div>
🔥 Validate your user inputs like never before with highly intuitive constraints pipeline.

✨ Easy to use pre-defined constraints covering most of your everyday validation needs.

🖍 Better still, you can create your own constraints on the go.

🏎 Set your own order in which constraints are evaluated.

🚜 Receive a list of constraints that got violated or receive the first one that was violated in the pipeline.

---

#### Overview
`valify` works in an extremely simple manner.

<div>
<center>
<img src="https://gitlab.com/uploads/-/system/personal_snippet/2037052/e78c3239fa4438a9915b70d8713416bd/Validy_Pipeline__1_.png" width=1000/>
</center>
</div>


* You have a list of constraints as part of your validation/constraints pipeline.
* The way you list defines the order in which those constraints are evaluated.
* Once you give it a run, at the end your pipeline you receive a list of constraints that were violated by your input.
* If no constraints were violated, you receive an empty list.
* Optionally, you can get access to only the first violation or you can simply check if any violation did occur at all.


#### Installation
To use `valify`, you'd have to add the following dependency under your `pubspec.yaml/depencencies` section.

```yaml
# pubspec.yaml
dependencies:
  valify: ^0.0.1
```

Let's get started.

#### Creating a `valifying` pipeline
```dart
import 'package:valify/valifier.dart';

final valifier = Valifier(
    constraints: [
        MaxLengthLimitingConstraint(
            maxLength: 64,
        ),
        MinimumLengthRequiredConstraint(
            minLength: 8,
        ),
        UpperCaseCharactersRequiredConstraint(),
        LowerCaseCharactersRequiredConstraint(),
        DigitsRequiredConstraint(),
        SpecialCharactersRequiredConstraint(
            specialCharacters: ['@', '$', '-', '%'],
        ),
    ]
)
```


After having created the above `valifer` object, it's very simple to validate any strings thereafter.

#### Validating `userInput` using `valifying` pipeline
```dart
// Let's assume user has entered something that is captured in the variable [userInput]
final violatedConstraints = valifier.allConstraintsViolatedOn(userInput);

if (violatedConstraints.isEmpty) {
    // User didn't violate any constraints.
    print('Awesome user. You did violate any constraints.');
} else {
    // Some constraints were violated.
    print('Uh oh! Some constraints were violated.');
    violatedConstraints.forEach(
        (violatedConstraint) => print(violatedConstraint.violationMessage),
    );
}
```
* You may also just fetch the first violation that occurred on the given input by using `firstConstraintViolatedOn()` method of the `Valifier`.
* Or you may even not go that far as you can easily toget to know if any constraints were violated at all by using `areAllConstraintsSatisfiedOn()` method of the `Valifier`.

> ___ NOTE ___
> You can optionally pass-in a `violationMessage` parameter to any of your constraints. 
> This `violationMessage` can be useful later on as shown above [`print(violatedConstraint.violationMessage)`]

----
#### Want to contribute?
I'll be more than happy to receive your `PR` at [github.com/m-zaink/valify](https://github.com/m-zaink/valify.git).
