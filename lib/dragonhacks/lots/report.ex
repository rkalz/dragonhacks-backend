defmodule Dragonhacks.Lots.Report do
  use Ecto.Schema
  import Ecto.Changeset

  alias Dragonhacks.Lots.Lot


  schema "reports" do
    field :status, :integer, default: 0
    field :timestamp, :utc_datetime
    belongs_to :lot, Lot

    timestamps()
  end

  @doc false
  def changeset(report, attrs) do
    report
    |> cast(attrs, [:status, :timestamp, :lot_id])
    |> validate_required([:status, :timestamp, :lot_id])
    |> foreign_key_constraint(:lot_id)
  end
end
