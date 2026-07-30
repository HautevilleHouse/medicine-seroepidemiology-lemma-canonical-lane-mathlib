import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineSeroepidemiologyLemmaCanonicalLaneLean

structure DiagnosticTest where
  sensitivity : ℝ
  specificity : ℝ
  prevalence : ℝ
  positivePredictiveValue : Prop
  negativePredictiveValue : Prop

structure DiagnosticTestEvidence (T : DiagnosticTest) where
  positivePredictiveValueClosed : T.positivePredictiveValue
  negativePredictiveValueClosed : T.negativePredictiveValue

def DiagnosticTestClosed (T : DiagnosticTest) : Prop :=
  T.positivePredictiveValue ∧ T.negativePredictiveValue

theorem diagnostic_test_closed_from_evidence (T : DiagnosticTest)
    (E : DiagnosticTestEvidence T) : DiagnosticTestClosed T := by
  exact And.intro E.positivePredictiveValueClosed E.negativePredictiveValueClosed

end MedicineSeroepidemiologyLemmaCanonicalLaneLean
end HautevilleHouse