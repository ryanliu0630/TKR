# TKR
A project that optimizes the geometry of a total knee replacement

Total knee replacements fail in many patients due to pitting and cracking of the polyethylene layer of the tibial component. This is most likely due to the high stresses in polyethylene as a result of contact between the femoral and tibial components of the prosthesis. In this project, I analyzed the stresses put on the polymer by two loads– one 20mm from the left of the prosthesis and one 60mm from the left. Assuming that the prosthesis is a finite composite beam consisting of a polyethylene layer and a metal layer, I used beam on elastic foundation and hertz contact theories to optimize the thickness of the polyethylene layer, the thickness of the metal layer, and the radii of the tibial and femoral components in the frontal and sagittal plane. 

Total knee replacements have a 95% survival rate over 15 years, but many do still fail. This is a result of pitting and cracking of the polyethylene layer in the tibial component to the contact between that and the femoral component. Our goal is to develop a prosthesis design that can minimize this contact stress and prolong the life of the prosthesis. A good design should be able to support habitual and extreme loading cases as well as consider the stresses in the trabecular bone. To develop such a prosthesis, we have to consider what parts of it need to be optimized. Since the materials are already fixed, we have to optimize the geometry of the design, which include– the thickness of the plastic, the thickness of the metal, and the four radii of the curvature of the femoral and tibial components in the sagittal and frontal planes. The design should be optimized in cases of habitual loading (P1 = P2 = 1500N) and an extreme loading case (P1 = 2500N, P2 = 500N).	We want to calculate the stresses at three critical points– the point of contact, the point of maximum shear stress, and the point of maximum tensile stress. These are the places in which the prosthesis is most likely to fail. Using BOEF and Hertz contact stress theory, we will calculate the stresses at these 3 critical points to see which one will fail first and optimize the design accordingly. 
	
BendStressPolymer and BendStressMetal calculate the bending stresses in the polymer and metal components respectively. StressExtreme and StressHabitual for A, B, and C calculate the total stresses in the three critical points for both the habitual and extreme loading cases. Our objective function calculates the max Von Mises stresses for both the habitual and extreme loading cases and averages the two and that is the function we are trying to optimize given the contraints in the contraints file.

