class Audit < ActiveRecord::Base
  belongs_to :instructor
  belongs_to :lesson_plan
  # @@ is a class level method where you can access variables throughout the class

  @@comps = ["awesome", "magnificent", "sweet", "incredible", "marvelous", "boss", "excellent", "top-notch", "astounding", "cool", "legendary", "rad", "spectacular", "super", "superb", "terrific", "wicked", "great", "aces", "perfect", "tremendous", "astounding", "glorious", "sweet", "stunning", "phenomenal", "valiant", "brilliant", "astonishing", "impressive", "remarkable", "divine", "powerful", "compelling"]

  @@compsReset = ["awesome", "magnificent", "sweet", "incredible", "marvelous", "boss", "excellent", "top-notch", "astounding", "cool", "legendary", "rad", "spectacular", "super", "superb", "terrific", "wicked", "great", "aces", "perfect", "tremendous", "astounding", "glorious", "sweet", "stunning", "phenomenal", "valiant", "brilliant", "astonishing", "impressive", "remarkable", "divine", "powerful", "compelling"]

  @@atLeastCheck = {
    "vocal_enc_num" => 5,
    "discuss_num" => 4,
    "mov_aw_noi_num" => 4,
    "mean_quest_num" => 15,
    "directed_quest_num" => 10,
    "anti_jargon_num" => 7,
    "engage_num" => 7,
    "overall_num" => 7,
    "audio_qual_num" => 3
  }

  @@exact = {
    "big_flag" => false,
    "objs" => true,
    "action_flag" => false,
    "tangent_num" => 0,
    "fifteen_noeng" => false,
    "nervous" => false,
    "percent_hp_lp" => "100%",
    "code_is_no_big" => false
  }

  def update_comps d
    @@comps.delete(d)
  end

  def give_comp
    if @@comps.length == 0
      @@comps = @@compsReset.clone
    end

    c = @@comps.sample
    update_comps c

    c
  end

  def retAt
    @@atLeastCheck
  end

  def retEx
    @@exact
  end

  def exact_check(key, val)
    if @@exact[key] == val
      return true
    else
      return false
    end
  end

  def at_least_check(key, val)
    if (@@atLeastCheck[key] <= val)
      return true
    else
      return false
    end
  end

  def for_percent_lp p
    if (p == "80% to 100%") || (p == "100%")
      true
    else
      false
    end
  end
end
