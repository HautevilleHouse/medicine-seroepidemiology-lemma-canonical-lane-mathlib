import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineSeroepidemiologyLemmaCanonicalLaneLean

structure CompartmentDynamicsPackage where
  susceptible : Real -> Real
  infected : Real -> Real
  recovered : Real -> Real
  vaccinationRate : Real
  waningRate : Real
  forceOfInfection : Real -> Real
  basicReproNumber : Real

structure CompartmentDynamicsEvidence (D : CompartmentDynamicsPackage) where
  susceptiblePositive : ∀ t, D.susceptible t ≥ 0
  infectedPositive : ∀ t, D.infected t ≥ 0
  recoveredPositive : ∀ t, D.recovered t ≥ 0
  forceOfInfectionMeasurable : True
  basicReproNumberPos : D.basicReproNumber > 0

def CompartmentDynamicsClosed (D : CompartmentDynamicsPackage) : Prop :=
  (∀ t, D.susceptible t ≥ 0) ∧ (∀ t, D.infected t ≥ 0) ∧ (∀ t, D.recovered t ≥ 0)

theorem compartment_dynamics_closed_from_evidence (D : CompartmentDynamicsPackage)
    (E : CompartmentDynamicsEvidence D) : CompartmentDynamicsClosed D := by
  exact And.intro E.susceptiblePositive (And.intro E.infectedPositive E.recoveredPositive)

end MedicineSeroepidemiologyLemmaCanonicalLaneLean
end HautevilleHouse