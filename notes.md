Have onboarding states managed by Enum.

Have a state in the view model that keeps track of the current onboarding state on screen.



Each onboarding state will keep track of the baby icon positions:
BabyIcon will have a RelativeRect begin and end property



We could also have a List of Rects, arranged from Top Right bottom left, positions.