import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineSeroepidemiologyLemmaCanonicalLaneLean

structure AdmissibleClass where
  object : SeroepidemiologyAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  SeroepidemiologyWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end MedicineSeroepidemiologyLemmaCanonicalLaneLean
end HautevilleHouse