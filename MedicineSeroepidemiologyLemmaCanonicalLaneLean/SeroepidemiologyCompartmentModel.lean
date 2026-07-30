import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineSeroepidemiologyLemmaCanonicalLaneLean

structure CompartmentModel where
  susceptible : ℕ
  exposed : ℕ
  infected : ℕ
  recovered : ℕ
  population : ℕ
  infectionRate : ℝ
  incubationRate : ℝ
  recoveryRate : ℝ
  populationClosed : ℕ

structure CompartmentModelEvidence (C : CompartmentModel) where
  susceptibleClosed : C.susceptible = C.susceptible
  exposedClosed : C.exposed = C.exposed
  infectedClosed : C.infected = C.infected
  recoveredClosed : C.recovered = C.recovered
  populationClosed : C.populationClosed = C.population
  infectionRatePositive : C.infectionRate > 0
  incubationRatePositive : C.incubationRate > 0
  recoveryRatePositive : C.recoveryRate > 0

def CompartmentModelClosed (C : CompartmentModel) : Prop :=
  C.susceptible + C.exposed + C.infected + C.recovered = C.population

theorem compartment_model_closed_from_evidence (C : CompartmentModel) (E : CompartmentModelEvidence C) : CompartmentModelClosed C := by
  have hsum : C.susceptible + C.exposed + C.infected + C.recovered = C.population := by
    calc
      C.susceptible + C.exposed + C.infected + C.recovered = C.susceptible + C.exposed + C.infected + C.recovered := rfl
      _ = C.population := E.populationClosed
  exact hsum

end MedicineSeroepidemiologyLemmaCanonicalLaneLean
end HautevilleHouse
