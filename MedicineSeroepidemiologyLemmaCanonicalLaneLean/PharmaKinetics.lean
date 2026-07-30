import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineSeroepidemiologyLemmaCanonicalLaneLean

structure PharmaKineticsPackage where
  absorptionRate : Real
  eliminationRate : Real
  volumeDistribution : Real
  halfLife : Real
  bioavailability : Real
  dose : Real -> Real
  concentration : Real -> Real

structure PharmaKineticsEvidence (P : PharmaKineticsPackage) where
  absorptionPos : P.absorptionRate > 0
  eliminationPos : P.eliminationRate > 0
  volumePos : P.volumeDistribution > 0
  halfLifeFormula : P.halfLife = Real.log 2 / P.eliminationRate
  bioavailabilityInRange : 0 ≤ P.bioavailability ∧ P.bioavailability ≤ 1

def PharmaKineticsClosed (P : PharmaKineticsPackage) : Prop :=
  P.absorptionRate > 0 ∧ P.eliminationRate > 0 ∧ P.volumeDistribution > 0

theorem pharma_kinetics_closed_from_evidence (P : PharmaKineticsPackage)
    (E : PharmaKineticsEvidence P) : PharmaKineticsClosed P := by
  exact And.intro E.absorptionPos (And.intro E.eliminationPos E.volumePos)

end MedicineSeroepidemiologyLemmaCanonicalLaneLean
end HautevilleHouse