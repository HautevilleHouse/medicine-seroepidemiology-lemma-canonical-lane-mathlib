import canonicalLaneMathlib.AdmissibleClass
import MedicineSeroepidemiologyLemmaCanonicalLaneLean.BridgeLemmas
import MedicineSeroepidemiologyLemmaCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace MedicineSeroepidemiologyLemmaCanonicalLaneLean

def ConstrainedSeroepidemiologyClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_seroepidemiology_endgame (A : AdmissibleClass) : ConstrainedSeroepidemiologyClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end MedicineSeroepidemiologyLemmaCanonicalLaneLean
end HautevilleHouse
