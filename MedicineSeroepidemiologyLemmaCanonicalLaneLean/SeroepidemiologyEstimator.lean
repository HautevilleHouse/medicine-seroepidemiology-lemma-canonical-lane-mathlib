import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineSeroepidemiologyLemmaCanonicalLaneLean

structure SeroepidemiologyEstimator where
  sampleSize : ℕ
  positiveCases : ℕ
  testSensitivity : ℝ
  testSpecificity : ℝ
  estimatedSeroprevalence : ℝ
  confidenceInterval : ℝ × ℝ
  estimatorConsistency : Prop

structure SeroepidemiologyEstimatorEvidence (E : SeroepidemiologyEstimator) where
  estimatorConsistencyClosed : E.estimatorConsistency

def SeroepidemiologyEstimatorClosed (E : SeroepidemiologyEstimator) : Prop :=
  E.estimatorConsistency

theorem seroepidemiology_estimator_closed_from_evidence (E : SeroepidemiologyEstimator) (Ev : SeroepidemiologyEstimatorEvidence E) :
  SeroepidemiologyEstimatorClosed E := by
  exact Ev.estimatorConsistencyClosed

end MedicineSeroepidemiologyLemmaCanonicalLaneLean
end HautevilleHouse