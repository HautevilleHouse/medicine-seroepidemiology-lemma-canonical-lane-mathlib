import canonicalLaneMathlib.AdmissibleClass
import MedicineSeroepidemiologyLemmaCanonicalLaneLean.CompartmentModels
import MedicineSeroepidemiologyLemmaCanonicalLaneLean.DiagnosticInference
import MedicineSeroepidemiologyLemmaCanonicalLaneLean.SurvivalAnalysis

namespace HautevilleHouse
namespace MedicineSeroepidemiologyLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied

def gateClosed (A : AdmissibleClass) : Prop :=
  A.remainderRecorded

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
  A.endpointSatisfied

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A :=
  A.remainderRecorded

def ConstrainedSeroepidemiologyClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_seroepidemiology_endgame (A : AdmissibleClass) :
    ConstrainedSeroepidemiologyClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end MedicineSeroepidemiologyLemmaCanonicalLaneLean
end HautevilleHouse