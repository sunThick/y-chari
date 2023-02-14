class CreateParts < ActiveRecord::Migration[7.0]
  def change
    create_table :parts do |t|

      t.text :fork_brand
      t.text :fork_name
      t.text :headset_brand
      t.text :headset_name
      t.text :columnspacer_brand
      t.text :columnspacer_name
      t.text :handlebar_brand
      t.text :handlebar_name
      t.text :stem_brand
      t.text :stem_name
      t.text :stemcap_brand
      t.text :stemcap_name
      t.text :grip_brand
      t.text :grip_name
      t.text :bartape_brand
      t.text :bartape_name
      t.text :barend_brand
      t.text :barend_name
      t.text :saddle_brand
      t.text :saddle_name
      t.text :seatpost_brand
      t.text :seatpost_name
      t.text :seatclamp_brand
      t.text :seatclamp_name
      t.text :tire_brand
      t.text :tire_name
      t.text :tube_brand
      t.text :tube_name
      t.text :wheel_brand
      t.text :wheel_name
      t.text :hub_brand
      t.text :hub_name
      t.text :cog_brand
      t.text :cog_name
      t.text :lockring_brand
      t.text :lockring_name
      t.text :freewheel_brand
      t.text :freewheel_name
      t.text :quickrelease_brand
      t.text :quickrelease_name
      t.text :crank_brand
      t.text :crank_name
      t.text :chainring_brand
      t.text :chainring_name
      t.text :chain_brand
      t.text :chain_name
      t.text :bottombrancket_brand
      t.text :bottombrancket_name
      t.text :pedals_brand
      t.text :pedals_name
      t.text :toecrip_brand
      t.text :toecrip_name
      t.text :toestrap_brand
      t.text :toestrap_name
      t.text :brake_brand
      t.text :brake_name
      t.text :brakelever_brand
      t.text :brakelever_name
      t.text :brakecable_brand
      t.text :brakecable_name
      t.text :shihter_brand
      t.text :shihter_name
      t.text :rack_brand
      t.text :rack_name
      t.text :bottle_brand
      t.text :bottle_name
      t.text :light_brand
      t.text :light_name
      t.text :lock_brand
      t.text :lock_name
      t.text :bell_brand
      t.text :bell_name
      t.text :helmet_brand
      t.text :helmet_name
      t.text :bag_brand
      t.text :bag_name

      t.timestamps
    end
  end
end
