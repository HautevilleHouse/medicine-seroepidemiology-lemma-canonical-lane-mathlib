import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineSeroepidemiologyLemmaCanonicalLaneLean

structure PharmacokineticModel where
  dose : ℝ
  volumeOfDistribution : ℝ
  clearance : ℝ
  halfLife : ℝ
  formulaConsistency : Prop

structure PharmacokineticsEvidence (P : PharmacokineticModel) where
  formulaConsistencyClosed : P.formulaConsistency

def PharmacokineticsClosed (P : PharmacokineticModel) : Prop :=
  P.formulaConsistency

theorem pharmacokinetics_closed_from_evidence (P : PharmacokineticModel) (E : PharmacokineticsEvidence P) :
  PharmacokineticsClosed P := by
  exact E.formulaConsistencyClosed

end MedicineSeroepidemiologyLemmaCanonicalLaneLean
end HautevilleHouse