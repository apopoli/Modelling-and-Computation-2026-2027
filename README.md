# Modelling-and-Computation-2026-2027

## Virtuale page

https://virtuale.unibo.it/course/view.php?id=84132

## Midterm exam

The midterm exam will take place on **Monday, November 2, 2026**, during the regular class time and **in the classroom**.

The exam will cover all theoretical topics discussed in class up to and including **Tuesday, October 27, 2026**.

The exam will be **theory only**. MATLAB exercises and practical sessions are **not included**.

## Examples of possible theory questions

The following are **examples of possible theory questions**. They are intended to illustrate the expected level and style of the exam and do **not** constitute an exhaustive list of the topics that may be assessed.

A complete answer should include the main concepts discussed during the lectures, together with the relevant derivations, physical or mathematical interpretations, and diagrams or sketches where appropriate.

1. **Topology concepts**
   - Define metric space, connected metric space, and domain.
   - Discuss simply connected domains in 2D and 3D.
   - Discuss reduction methods for multiply connected domains in 2D and 3D.

2. **Vector differential operators**
   - Define and discuss the gradient, divergence, and curl operators.
   - Discuss the relation between the divergence theorem and solenoidal fields.
   - Discuss the relation between Stokes' theorem and conservative fields.

3. **Gauge freedom**
   - Discuss gauge freedom for conservative and solenoidal fields.
   - Discuss the use of scalar and vector potentials in the computation of conservative and solenoidal fields.

4. **Helmholtz decomposition**
   - State the Helmholtz decomposition theorem.
   - Show how a generic vector field can be decomposed into a conservative part and a solenoidal part.

5. **Basics of electromagnetism**
   - Discuss the Lorentz force and provide examples.
   - Define current density and volume charge density.

6. **Polarization and magnetization**
   - Discuss the physical meaning and effects of electric polarization and magnetization.
   - Show how Maxwell's equations are extended to account for polarization and magnetization.

7. **Maxwell's equations in matter**
   - Discuss Maxwell's equations in matter.
   - Discuss the main material constitutive laws.

8. **Poynting's theorem**
   - Derive and discuss Poynting's theorem for linear, isotropic materials.

9. **Uniqueness of electromagnetic problems**
   - Discuss the uniqueness theorem for general electromagnetic problems.

10. **Green's identities**
    - Derive and discuss Green's first and second identities.

11. **Harmonic functions**
    - Define harmonic functions and provide examples.
    - Discuss the mean-value theorem for harmonic functions and its main corollaries.

12. **Conductive domain with mixed boundary conditions**
    - Consider an irregularly shaped homogeneous conducting region with conductivity \(\sigma=\sigma_0\). One portion of the boundary is held at a prescribed electric potential. Another portion is connected to ground through a resistor.
    - Derive an appropriate formulation for the electric-potential distribution in the conducting region.
    - Show how the resistive connection leads to a Robin-type boundary condition.
    - Discuss the role of the coefficients in
      \[
      \alpha \varphi+\beta\frac{\partial\varphi}{\partial n}=\gamma
      \]
      and their relation to uniqueness of the solution.

13. **Uniqueness of Poisson problems**
    - Prove uniqueness for a Poisson problem with Dirichlet boundary conditions.
    - Extend the proof to mixed Dirichlet-Neumann boundary conditions.
    - Extend the proof to mixed Dirichlet-Robin boundary conditions.

14. **Computer arithmetic**
    - Discuss fixed-point and floating-point representations.
    - Derive estimates for the corresponding absolute and relative errors.
    - Discuss the main features of the IEEE 754 floating-point standard.

15. **Numerical differentiation**
    - Starting from the definition of the first derivative, use Taylor expansions to derive forward, backward, and centered finite-difference formulas.
    - Discuss their accuracy and provide a geometrical interpretation.
    - Derive a centered finite-difference approximation for the second derivative.

16. **Piecewise linear interpolation**
    - Discuss piecewise linear interpolation in 1D.
    - Explain why piecewise interpolation is generally preferred to high-degree global polynomial interpolation.
    - Extend the concept of linear interpolation to triangular elements in 2D.

17. **Numerical integration**
    - Discuss the rectangle rule.
    - Discuss the trapezoidal rule.
    - Introduce Gaussian quadrature and the concept of a quadrature rule.
    - Show how Gaussian quadrature can be mapped from a reference interval to an arbitrary interval.

18. **Finite Difference Method: 1D Poisson problem**
    - Formulate a 1D Poisson problem with a Dirichlet boundary condition on one side and a Neumann boundary condition on the other.
    - Derive the finite-difference discretization.
    - Show how the discrete equations are assembled into a linear system.

19. **Finite Difference Method: 2D Poisson problem**
    - Formulate a 2D Poisson problem with Dirichlet and Neumann boundary conditions.
    - Derive the finite-difference discretization.
    - Discuss the assembly of the resulting linear system.

20. **Finite Element Method: Poisson problem**
    - Introduce piecewise interpolation over finite elements.
    - Starting from the strong formulation, derive the weighted-residual formulation.
    - Introduce the Galerkin approach and derive the weak formulation.
    - Derive the element-level nodal equations.
    - Discuss the assembly of the global linear system.
    - For the 2D case, discuss linear interpolation over triangular elements.