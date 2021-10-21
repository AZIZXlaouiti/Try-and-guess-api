class CreateCanvasSketches < ActiveRecord::Migration[6.1]
  def change
    create_table :canvas_sketches do |t|

      t.timestamps
    end
  end
end
