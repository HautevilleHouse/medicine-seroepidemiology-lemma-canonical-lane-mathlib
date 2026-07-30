import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineSeroepidemiologyLemmaCanonicalLaneLean

structure CompartmentModel where
  susceptible : Type u
  infected : Type v
  recovered : Type w
  transmissionRate : ℝ
  recoveryRate : ℝ
  modelDefinition : Prop
  positivityConditions : Prop

structure CompartmentModelEvidence (M : CompartmentModel) where
  modelDefinitionClosed : M.modelDefinition
  positivityConditionsClosed : M.positivityConditions

def CompartmentModelClosed (M : CompartmentModel) : Prop :=
  M.modelDefinition ∧ M.positivityConditions

theorem compartment_model_closed_from_evidence (M : CompartmentModel)
    (E : CompartmentModelEvidence M) : CompartmentModelClosed M := by
  exact And.intro E.modelDefinitionClosed E.positivityConditionsClosed

end MedicineSeroepidemiologyLemmaCanonicalLaneLean
end HautevilleHouse