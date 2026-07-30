import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineSeroepidemiologyLemmaCanonicalLaneLean

structure SurvivalModel where
  hazardFunction : Type u
  survivalFunction : Type v
  censoringMechanism : Prop
  proportionalHazardsAssumption : Prop

structure SurvivalModelEvidence (M : SurvivalModel) where
  censoringMechanismClosed : M.censoringMechanism
  proportionalHazardsAssumptionClosed : M.proportionalHazardsAssumption

def SurvivalModelClosed (M : SurvivalModel) : Prop :=
  M.censoringMechanism ∧ M.proportionalHazardsAssumption

theorem survival_model_closed_from_evidence (M : SurvivalModel)
    (E : SurvivalModelEvidence M) : SurvivalModelClosed M := by
  exact And.intro E.censoringMechanismClosed E.proportionalHazardsAssumptionClosed

end MedicineSeroepidemiologyLemmaCanonicalLaneLean
end HautevilleHouse