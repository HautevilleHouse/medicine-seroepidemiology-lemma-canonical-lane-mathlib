import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineSeroepidemiologyLemmaCanonicalLaneLean

structure SeroepidemiologyModel where
  population : Type u
  compartments : List String
  transmissionRates : String -> String -> Real
  recoveryRate : Real
  seroprevalence : Real -> Real
  testSensitivity : Real
  testSpecificity : Real
  vaccineEffectiveness : Real

structure SeroepidemiologyEvidence (M : SeroepidemiologyModel) where
  compartmentsValid : M.compartments ≠ []
  transmissionRatesNonneg : ∀ x y, M.transmissionRates x y ≥ 0
  recoveryRatePos : M.recoveryRate > 0
  seroprevalencePos : ∀ t, M.seroprevalence t ≥ 0
  testSensitivityInRange : 0 < M.testSensitivity ∧ M.testSensitivity ≤ 1
  testSpecificityInRange : 0 < M.testSpecificity ∧ M.testSpecificity ≤ 1

def SeroepidemiologyClosed (M : SeroepidemiologyModel) : Prop :=
  M.compartments ≠ [] ∧ (∀ x y, M.transmissionRates x y ≥ 0) ∧ M.recoveryRate > 0

theorem seroepidemiology_closed_from_evidence (M : SeroepidemiologyModel)
    (E : SeroepidemiologyEvidence M) : SeroepidemiologyClosed M := by
  exact And.intro E.compartmentsValid (And.intro E.transmissionRatesNonneg E.recoveryRatePos)

end MedicineSeroepidemiologyLemmaCanonicalLaneLean
end HautevilleHouse