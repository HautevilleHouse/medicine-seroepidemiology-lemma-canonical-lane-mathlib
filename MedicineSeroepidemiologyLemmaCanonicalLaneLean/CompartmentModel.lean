import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineSeroepidemiologyLemmaCanonicalLaneLean

structure CompartmentModel where
  susceptibleRate : ℝ
  infectedRate : ℝ
  recoveredRate : ℝ
  transmissionRate : ℝ
  recoveryRate : ℝ
  modelConsistency : Prop

structure CompartmentModelEvidence (M : CompartmentModel) where
  modelConsistencyClosed : M.modelConsistency

def CompartmentModelClosed (M : CompartmentModel) : Prop :=
  M.modelConsistency

theorem compartment_model_closed_from_evidence (M : CompartmentModel) (E : CompartmentModelEvidence M) :
  CompartmentModelClosed M := by
  exact E.modelConsistencyClosed

end MedicineSeroepidemiologyLemmaCanonicalLaneLean
end HautevilleHouse