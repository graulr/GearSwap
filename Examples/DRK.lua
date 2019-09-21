include("organizer-lib")
-------------------------------------------------------------------------------------------
--                           GGGG  RRR     A    U   U L    RRR                           --
--              Crafted by:  G __  R  R   A A   U   U L    R  R                          --
--                           G  G  R r   AAAAA  U   U L    R r                           --
--                           GGGG  R  R A     A UUUUU LLLL R  R                          --
-------------------------------------------------------------------------------------------
--               How you declare a set for a specific ability or spell:                  --
--            sets.midcast.Cure = {}   <- Does not have a space in title                 --
--      sets.midcast["Cure II"] = {}   <- Space in title so ["Spell Name"] must be used  --
-------------------------------------------------------------------------------------------
--  ############# CAPITALIZATION MATTERS! -> ["cure II"] won't work! ##################  --
-------------------------------------------------------------------------------------------
--             precast is automatically called before an action is initiated             --
--             midcast is automatically called during the action                         --
--             aftercast is automatically called after the action occurs                 --
-------------------------------------------------------------------------------------------

function macro_setup()
    --===================================================================================--
    --                                                                                   --
    --                                        Macros                                     --
    --                                                                                   --
    --===================================================================================--
    -- This function runs on file load & character job changes
    -- Set the current macro book & page according to your subjob
    -- Ex: set_macro(2, 1) would set macro book 2 & page 1

    if player.sub_job == "WAR" then
        set_macro(1, 1)
    elseif player.sub_job == "SAM" then
        set_macro(2, 1)
    end
end


function get_sets()
    --===================================================================================--
    --                                                                                   --
    --                                       Base Sets                                   --
    --                                                                                   --
    --===================================================================================--
    -- Base sets that flow through all other sets
    --
    -- A General set of gear you will idle in (before and after battle)
    sets.Idle = {
        main="Darksteel Falx +1",
        sub="Pole Grip",
        range="Tracker's Bow +1",
        ammo="Bronze Bolt",
        head="Zeal Cap +1",
        body="Haubergeon +1",
        hands="Luisant Moufles",
        legs="Luisant Brayettes",
        feet="Bounding Boots",
        neck="Chivalrous chain",
        waist="Speed Belt",
        left_ear="Assault Earring",
        right_ear="Spike Earring",
        left_ring="Victory Ring +1",
        right_ring="Victory Ring +1",
        back="Jaguar Mantle",
    }
    IDLE_SET = sets.Idle

    -- A set of gear to engage the monster in
    -- If weapons differ from `sets.Idle` TP will be lost after each fight
    sets.Engaged = set_combine(IDLE_SET, {})
    ENGAGED_SET = sets.Engaged

    -- An alternate base set that overrides Engaged and Idle after the command:
    -- `//gs c alternate` has been run
    -- `//gs c primary` will set it back to normal
    sets.ALTERNATE = {
        main="Vassago's Scythe",
    }


    --===================================================================================--
    --                                                                                   --
    --                                        Precast                                    --
    --                                                                                   --
    --===================================================================================--
    sets.precast = {} -- Ignore and don't remove

    -- Fast cast gear
    sets.precast.FastCast = {}

    -- Cure spell *cast time reduction* gear only
    -- Use sets.midcast.Cure for everything else
    sets.precast.Cure = set_combine(sets.precast.FastCast, {})

    -- Enhancing magic *cast time reduction* gear only
    -- Use sets.midcast["Enhancing Magic"] for everything else
    sets.precast["Enhancing Magic"] = set_combine(sets.precast.FastCast, {})


    --===================================================================================--
    --                                                                                   --
    --                                        Midcast                                    --
    --                                                                                   --
    --===================================================================================--
    sets.midcast = {} -- Ignore & don't remove


    ---------------------------------------------------------------------------------------
    --                                     Job Abilities                                 --
    ---------------------------------------------------------------------------------------
    --- A General set of ability gear
    sets.midcast.Ability = set_combine(ENGAGED_SET, {})
    ABILITY = sets.midcast.Ability

    -- Specific abilities:
    sets.midcast["Souleater"] = set_combine(ABILITY, {
        head="Chaos burgeonet",
        body="Gloom Breastplate",
    })
    sets.midcast["Weapon Bash"] = set_combine(ABILITY, {
        hands="Chaos Gauntlets",
    })


    ---------------------------------------------------------------------------------------
    --                                    Ranged Attack                                  --
    ---------------------------------------------------------------------------------------
    sets.midcast["Ranged Attack"] = set_combine(ENGAGED_SET, {})


    ---------------------------------------------------------------------------------------
    --                                    Weapon Skills                                  --
    ---------------------------------------------------------------------------------------
    -- A General set of weapon skill gear (will swap for all weapon skills)
    sets.midcast["Weapon Skill"] = set_combine(ENGAGED_SET, {
        head="Chaos burgeonet",
        body="Byrnie +1",
        waist="Swordbelt +1",
        hands="Pallas's Bracelets",
    })
    WEAPON_SKILL = sets.midcast["Weapon Skill"]

    -- Specific weapon skills:
    sets.midcast["Fast Blade"] = set_combine(WEAPON_SKILL, {})


    ---------------------------------------------------------------------------------------
    --                                    General Magic                                  --
    ---------------------------------------------------------------------------------------
    -- A General set of magic midcast gear (will swap for all magic)
    -- Spell casters should put generic haste gear here
    sets.midcast.Magic = set_combine(ENGAGED_SET, {})
    MAGIC_SET = sets.midcast.Magic


    ---------------------------------------------------------------------------------------
    --                                   Elemental Magic                                 --
    ---------------------------------------------------------------------------------------
    -- A General set of elemental magic gear (will swap for all elemental magic)
    sets.midcast["Elemental Magic"] = set_combine(MAGIC_SET, {})
    ELEMENTAL_MAGIC = sets.midcast["Elemental Magic"]

    -- Specific elemental magic:
    -- Note: These sets will swap for I, II, III, IV, V, ga, & ra versions of the spell
    sets.midcast.Stone = set_combine(ELEMENTAL_MAGIC, {})
    sets.midcast.Water = set_combine(ELEMENTAL_MAGIC, {})
    sets.midcast.Aero = set_combine(ELEMENTAL_MAGIC, {})
    sets.midcast.Fire = set_combine(ELEMENTAL_MAGIC, {})
    sets.midcast.Blizzard = set_combine(ELEMENTAL_MAGIC, {})
    sets.midcast.Thunder = set_combine(ELEMENTAL_MAGIC, {})


    ---------------------------------------------------------------------------------------
    --                                    Healing Magic                                  --
    ---------------------------------------------------------------------------------------
    -- A General set of healing magic gear (will swap for all healing magic)
    sets.midcast["Healing Magic"] = set_combine(MAGIC_SET, {})
    HEALING_MAGIC = sets.midcast["Healing Magic"]

    -- Specific healing magic:
    -- Note: This will swap for the I, II, III, IV, V, ga, & ra versions of Cure
    sets.midcast.Cure = set_combine(HEALING_MAGIC, {})


    ---------------------------------------------------------------------------------------
    --                                   Enhancing Magic                                 --
    ---------------------------------------------------------------------------------------
    -- A General set of enhancing magic gear (will swap for all enhancing magic)
    sets.midcast["Enhancing Magic"] = set_combine(MAGIC_SET, {})
    ENHANCING_MAGIC = sets.midcast["Enhancing Magic"]

    -- Specific enhancing magic:
    sets.midcast.Stoneskin = set_combine(ENHANCING_MAGIC, {})


    ---------------------------------------------------------------------------------------
    --                                   Enfeebling Magic                                --
    ---------------------------------------------------------------------------------------
    -- A General set of enfeebling magic gear (will swap for all enfeebling magic)
    sets.midcast["Enfeebling Magic"] = set_combine(MAGIC_SET, {
        neck="Enfeebling Torque",
        body="Chaos cuirass",
    })
    ENFEEBLING_MAGIC = sets.midcast["Enfeebling Magic"]

    -- Specific enfeebling magic:
    sets.midcast.Dia = set_combine(ENFEEBLING_MAGIC, {})


    ---------------------------------------------------------------------------------------
    --                                     Blue Magic                                    --
    ---------------------------------------------------------------------------------------
    -- A General set of blue magic gear (will swap for all blue magic)
    sets.midcast["Blue Magic"] = set_combine(MAGIC_SET, {})
    BLUE_MAGIC = sets.midcast["Blue Magic"]

    -- Specific blue magic:
    sets.midcast["Magic Fruit"] = set_combine(BLUE_MAGIC, {})


    ---------------------------------------------------------------------------------------
    --                                     Dark Magic                                    --
    ---------------------------------------------------------------------------------------
    -- A General set of dark magic gear (will swap for all dark magic)
    sets.midcast["Dark Magic"] = set_combine(MAGIC_SET, {
        head="Chaos burgeonet",
        neck="Dark Torque",
    })
    DARK_MAGIC = sets.midcast["Dark Magic"]

    -- Specific dark magic:
    sets.midcast.Drain = set_combine(DARK_MAGIC, {})


    ---------------------------------------------------------------------------------------
    --                                    Divine Magic                                   --
    ---------------------------------------------------------------------------------------
    -- A General set of divine magic gear (will swap for all divine magic)
    sets.midcast["Divine Magic"] = set_combine(MAGIC_SET, {})
    DIVINE_MAGIC = sets.midcast["Divine Magic"]

    -- Specific divine magic spells:
    -- Note: This will swap for the I, II, III, IV, V, ga, & ra versions of Banish
    sets.midcast.Banish = set_combine(DIVINE_MAGIC, {})


    ---------------------------------------------------------------------------------------
    --                                    Summoning Magic                                --
    ---------------------------------------------------------------------------------------
    -- A General set of summoning magic gear (will swap for all summons)
    sets.midcast["Summoning Magic"] = set_combine(MAGIC_SET, {})
    SUMMONING_MAGIC = sets.midcast["Summoning Magic"]

    -- Specific summoning magic spells:
    sets.midcast.Carbuncle = set_combine(SUMMONING_MAGIC, {})


    ---------------------------------------------------------------------------------------
    --                                       Geomancy                                    --
    ---------------------------------------------------------------------------------------
    -- A General set of geomancy gear (will swap for all geomancy)
    sets.midcast.Geomancy = set_combine(MAGIC_SET, {})


    ---------------------------------------------------------------------------------------
    --                                       Ninjitsu                                    --
    ---------------------------------------------------------------------------------------
    -- A General set of ninjitsu gear (will swap for all ninjitsu)
    sets.midcast.Ninjitsu = set_combine(MAGIC_SET, {})


    ---------------------------------------------------------------------------------------
    --                                        Songs                                      --
    ---------------------------------------------------------------------------------------
    -- A general set of song gear (will swap for all songs)
    sets.midcast.Singing = set_combine(ENGAGED_SET, {})
    SINGING = sets.midcast.Singing

    -- Specific song types:
    -- Note: All of these sets will swap for the  II, III, IV, V versions of the song
    sets.midcast.Paeon = set_combine(SINGING, {})
    sets.midcast.Requiem = set_combine(SINGING, {})
    sets.midcast.Lullaby = set_combine(SINGING, {})
    sets.midcast.Ballad = set_combine(SINGING, {})
    sets.midcast.Minne = set_combine(SINGING, {})
    sets.midcast.Minuet = set_combine(SINGING, {})
    sets.midcast.Madrigal = set_combine(SINGING, {})
    sets.midcast.Prelude = set_combine(SINGING, {})
    sets.midcast.Mambo = set_combine(SINGING, {})
    sets.midcast.March = set_combine(SINGING, {})
    sets.midcast.Etude = set_combine(SINGING, {})
    sets.midcast.Carol = set_combine(SINGING, {})
    sets.midcast.Threnody = set_combine(SINGING, {})
    sets.midcast.Finale = set_combine(SINGING, {})
    sets.midcast.Mazurka = set_combine(SINGING, {})
    sets.midcast.Elegy = set_combine(SINGING, {})
    sets.midcast.Virelai = set_combine(SINGING, {})


    --===================================================================================--
    --                                                                                   --
    --                                      Aftercast                                    --
    --                                                                                   --
    --===================================================================================--
    sets.aftercast = {} -- Ignore and don't remove


    ---------------------------------------------------------------------------------------
    --                                       Resting                                     --
    ---------------------------------------------------------------------------------------
    -- MP+ / HP+ resting gear
    sets.aftercast.Resting = set_combine(IDLE_SET, {})


    --===================================================================================--
    --                                                                                   --
    --                                     Cosmetic Sets                                 --
    --                                                                                   --
    --===================================================================================--
    -- Sets you might not be using for content but are fun to walk
    -- around in. Equipped via: //gs c equip AF2

    -- Artifact set
    sets.AF = {
        head="Chaos burgeonet",
        body="Chaos Cuirass",
        hands="Chaos Gauntlets",
        legs="Chaos Flanchard",
        feet="Chaos Sollerets",
    }

    -- Relic Set
    sets.AF2 = {}

    -- Empyrean Set
    sets.AF3 = {}


    --===================================================================================--
    --                                                                                   --
    --                                      Craft Sets                                   --
    --                                                                                   --
    --===================================================================================--
    -- Sets for crafting. Equipped via: //gs c equip Alchemy

    sets.Fishing = {}

    sets.Woodworking = {}

    sets.Smithing = {}

    sets.Goldsmithing = {}

    sets.Clothcraft = {}

    sets.Leathercraft = {}

    sets.Bonecraft = {}

    sets.Alchemy = {}

    sets.Cooking = {}

    sets.Synergy = {}


    ------------------------------------ End of gearsets ----------------------------------
    -- Sets macros on file load
    macro_setup()
end


--=======================================================================================--
--                                                                                       --
--                                     Optional Config                                   --
--                                                                                       --
--=======================================================================================--
-- Setting to true keeps the last midcast gear change until the next user triggered event
-- (nice for casters who want to see spell animations)
keep_gear_until_next_event = false


-----------------------------------------------------------------------------------------------------
--=================================================================================================--
--=================================================================================================--
--=================================================================================================--
--============================= Alter code below at your own risk! ================================--
--=================================================================================================--
--=================================================================================================--
-----------------------------------------------------------------------------------------------------
-- --------:n:::::::::::::::::::::::::::::--::::::::::::::::::::::::---::::://////::::::::::::::::///
-- ::::::::nNn::::::::::::::::::::::::------:::::::::::----------------:::::////////:::::::::::::::::
-- ::::::::dNN::::::::::::::::::::::::------:::::::::::----------------::::::://////:::::::::::::::::
-- :::-----NNNd::::::::::---------------------------------------:::::::::::::::::::::::::::::::::::::
-- --------NNNN:::::::::::::--..........---------------------------:::::::::::::::::::::::::::-.....-
-- --------NmNN::::::::---------...........-------::::::::::::-------:::::::::::::-----..............
-- ---....-NNNNo.----------........---------------::::::::::::--------------..........```````........
-- ----....mNNNy.......--.....-------------:::::::::::::::---...................```````````````````..
-- -------.hNNNd........---------------::::::::::::::::::-----...................`````````````.......
-- --------sNNNN-......---------------::::::::::::::::::::::::----................```````````........
-- -----...+NmNN:........--------:::::::::::::::::::::::--------------...............................
-- ------..-NmNN+..........-------::::::::::::::::::::::::::------------.........................----
-- -------.-NmNNh..`.......--------::::::::::::::::::::::::::::-:::-------...........................
-- ------..-NmNNN:.........----------------------------------------------------.....................-
-- ........-+NmNN........................ ________....................__........---------------......
-- .........NmNNh---------/+nnsnuss/-----/  _____/___________   __ __|  |_______..----------.........
-- .........NmNNN--------hmdzThenmmh+---/   \  __\_  __ \__  \ |  |  \  |\_  __ \....--..............
-- ------...:mNNNy-------mNnnOlduhho----\    \_\  \  | \// __ \|  |  /  |_|  | \/....................
-- ..........mmNNN--------szGuardx/------\______  /__|  (____  /____/|____/__|.......................
-- ........./NmNNN.-----------------------------\/-----------\/ ----------------------.........-.....
-- ....-...-.NmNNN.-..--.............................................................................
-- .........-dNNNNo..................................................................................
-- ........../NNNN:..................................................................................
-- ..........-mNNN/-.............--..................................................................
-- ..........ydhddhhs:...............................................................................
-- .........-NNNNNNmh:...............................................................................
-- ......--+yNNmNNNmdh:..............................................................................
-- .....-hysyhddddddyyy..............................................................................
-- .....odydhhyhhyyhdys..............................................................................
-- .....hddhdddhhdmNNNo-.............................................................................
-- ....:dddyhhhssmNNNMdy-............................................................................
-- ..../mmmdmmNdmMMMMMNNh-...............................::///o+/-...................................
-- :--..ommmmmmmNNNMMMNNms.............................:hNNNNNNNNNhs/-...............................
-- :-----hNNNNNNNMMMMNNNNNy-........................./odmmmNNNmmmNNmNd-..............................
-- -::::::ddNNNNMMMNNNMMMNN/------------------------+ddNNNNNNNmdddmmmmh-.............................
-- :::::::::sNNNNNNNNMMNNNddNy:::::::::-------------dmNdyyyhhdNmddddmmm+--------..-.....-------------
-- ::::::::::hNMMMNNNNNNmddNMNs///////:::::::------yNmy/-----:+hmmmmmNNs:::::::::::::::::::::::::::::
-- ///////:::/mNNNNNmmmdmNNMMNNmy/////////////:/:::mNmdyo:.--:+hmNNNNNMs://::::::::::::::::::::::::::
-- +++++++///odmMMmmmmmNNMMMMMMNmy+///////////////+NNyosso:shdmmNNNNNMMy//::::::::::::::::/://:::/:::
-- +++++///////+mMMMMMMMMMMMMMMMmhm+::::::::::::::+NNs--:-:/::/NNNNNMMMm/////////////////////////////
-- /+++++/+++///sNNNMMMMMMMMMMMMmhMNho////////////sNMdo/+/o/::oNNNMMMMMMs///////:::::::://::::::::::/
-- //////////////+dNNNMMMMMMMMNmdmMMNNhs+///////+oyNNmyyyysssymNNMMMMMMdh////////////////////////////
-- ///////////////ymNNMMMMMMNmdmNMMMMMNNys+//yhhydNNNmdhdddhhdNMMNNmNNm+/////////////////////////++++
-- /////////////+++shmmNNmmmmmNMMNMMMMMNhhyNNmdmNhdNmhhhyyhdmNNNNNNmdso+++++++++++++++++ooooooooooooo
-- //////+++++++++++osdmmmNMMMMMMMMMMMMNddymNNmdddhymdyyhdmmmmmmmNNNdddyooooooooooooooooooooooooooooo
-- ++++++++oooooooooooosyhmNMMMMMMMMMMMNmmshdNNmmhddhddysyhhhddmNNdhhNmNsoooosssssssooooooooooooooooo
-- ooooooooooooooooooooooooymMMMMMMMMMNmmhdmmNNNNNmdmmmdyyyyhmNmmhhdhdmMmysoooooooooooooo++++++++++++
-- oo+++++ooooooooossooosssosymMMMMMMNmddNMNddmNNMNNNmmmmmdmNmdmmmdmmNNMNmddyo++++++++++++++++///////
-- ooooooooooooooooooooooooooooymNNNNmmmMMMNhdNdyhdNNNNNNNMNNmNmmNNNMMMNhsyyhh+s//////////////::::://
-- +++++++++++++++++///++///////+shmNNNMMMMNyohssysymNNNNNNNNNMNNNNNNNmNmhysoodNh+//////////////::///
-- oo+++++++++++++++///////////////+dMMMMMMNNh+ssyydmNmNmNmmNmNNyhhsmNddddyshNNNmoo/:::::::::::::::::
-- ++++++++o+++++++/////////////////+mMMMMMNmdmsoyddmNmmmmmmmmNmhyyssmddyydNNNmhosss/::::::::-----:::
-- oooooooooo+++++///////////////////hMMMMMMhhmmhysssyhhmdmdmmdddyysssyhmNNNmhyyysss+/::::::---------
-- oo+++++++/////////////////////////hMMMMMNoyhddmmmdhyyyssyyssyyyhhdNMMNNNhydhyyys+dm/::::::::::::::
-- ++//::::://///////////////////////yMMMMMm/hysyyyyo/+shhyydmmmmmNddMMMNmdmmddhyosmMMm::::::::::::::
-- ::////////////////////++++////ss//sMMMMMh+hssssss:-:::::/yyyhhhdsNMMNmmNmmdyyhNMNNMMh/::::::::::::
-- /////////////////////////////sNNy/sMMMMm+yhyyyyho:---:-:syssyydsdMNy+ymmmmmmMMMMMMMMMdo///////////
-- ////++//+++//////////////:///+NMh/sMMMNs+o-::/odhysooosyhyyyhdhhMNs///+NMMMNMMMMMMMNMMNo++++++++++
-- //////////////////////////+ys+MMh/dMMMh/s:-----ysssssshs:::/+yhMNo++++/yMMMMMMMMMMMNMNys++++++++++
-- ////////+++////////////+++hhhoMMdoMMMmoo/-----+ssssssss::::/ohMMN+++++++mMMMMMNNMMMNmymNs+////////
-- ........................./mhshMMNNMMNso/:----+yssssssy/-::/oyMMMMy+:----/dMMMMMNNmdhdNNNh------:--
-- ........................./mdhmNNmNMMh+ho+///shyssssyy/--:/osNMMMMN+/:::-.-+sdmmmdmNNNNmNm.........
-- .........................dNdhmmdddNN+hysssyy///++oshysosyy/mMNNMMMy++++++//::dMNNNmmmmNm+.........
-- :::::::::::--------------+dmmmmmdomdshsssys:----.-osssssh+sMMMMMMd++++++++++++hdNNNNmhso+.........
-----------------------------------------------------------------------------------------------------

function precast(spell)
    if spell.action_type == "Magic" then
        spell_gear = get_gear_for_spell(spell)

        -- Cure & MND
        if spell.name:sub(1,3) == "Cur" and spell.name ~= "Cursna" then
            equip_with_alternate(set_combine(spell_gear, sets.precast.Cure))

        -- Enhancing
        elseif spell.skill == "Enhancing Magic" then
            equip_with_alternate(set_combine(spell_gear, sets.precast["Enhancing Magic"]))

        --- General fast cast
        elseif not sets.precast.FastCast == {} then
            equip_with_alternate(set_combine(spell_gear, sets.precast.FastCast))
        end
    end
end

function midcast(spell)
    midaction(false)
    equip(get_gear_for_spell(spell))
end

function aftercast(spell)
    if keep_gear_until_next_event then
        equip_with_alternate(spell)
    elseif player.status == "Engaged" then
        equip_with_alternate(sets.Engaged)
    elseif player.status == "Resting" then
        equip_with_alternate(sets.aftercast.Resting)
    else
        equip_with_alternate(sets.Idle)
    end
end

function status_change(new, old)
    if new == "Resting" then
        equip_with_alternate(sets.aftercast.Resting)
    elseif new == "Engaged" then
        equip_with_alternate(sets.Engaged)
    elseif new == "Idle" then
        equip_with_alternate(sets.Idle)
    end
end

-- Process user command input
function self_command(command)
    if (string.lower(command) == "help") then
        add_to_chat(8, "Command options:")
        add_to_chat(8, "//gs c primary")
        add_to_chat(8, "//gs c alternate")
        add_to_chat(8, "//gs c equip spell_name")
        add_to_chat(8, "--------------------------------")
        add_to_chat(8, "Type //gs c help <option> to learn more about that option")
    elseif (string.lower(command) == "help primary") then
        add_to_chat(8, "Setting to primary will disable any sets.ALTERNATE override behavior")
    elseif (string.lower(command) == "help alternate") then
        add_to_chat(8, "Setting to alternate will enable sets.ALTERNATE to override all other swaps")
    elseif (string.lower(command):sub(1,10) == "help equip") then
        add_to_chat(8, "Equips any set that matches the spell_name supplied (capitalization matters)")
        add_to_chat(8, "--------------------------------")
        add_to_chat(8, "Examples:")
        add_to_chat(8, "//gs c equip Fast Blade")
        add_to_chat(8, "//gs c equip Ranged")
        add_to_chat(8, "//gs c equip Resting")
        add_to_chat(8, "//gs c equip Cure")
    elseif (string.lower(command) == "primary") then
        add_to_chat(8, "Using primary gearset")
        use_alternate = false
        equip_with_alternate(sets.Idle)
    elseif (string.lower(command) == "alternate") then
        add_to_chat(8, "Using alternate gearset")
        use_alternate = true
        equip_with_alternate(sets.Idle)
    elseif (command:sub(1,6) == "equip ") then
        add_to_chat(8, "Equipping " .. command:sub(7))
        equip(get_gear_for_spell(nil, command:sub(7)))
    end
end

-- Get the appropriate gearset for the spell
function get_gear_for_spell(spell, spell_name)
    if (spell ~= nil) then
        spell_name = spell.name
        spell_type = spell.type
        spell_skill = spell.skill
        spell_action_type = spell.action_type
    end

    current_set = {}

    -- Resting
    if spell_name == "Resting" or spell_name == "Rest" then
        current_set = sets.aftercast.Resting

    -- Name match
    elseif sets.midcast[spell_name] then
        current_set = sets.midcast[spell_name]

    elseif sets[spell_name] then
        current_set = sets[spell_name]

    -- Ranged Attack
    elseif spell_name == "Ranged" then
        current_set = sets.midcast["Ranged Attack"]

    -- Corsair Quickdraw must be detected by type
    elseif spell_type == "CorsairShot" then
        current_set = sets.midcast.Quickdraw

    -- Abilities
    elseif spell_skill == "Ability" then
        current_set = sets.midcast.Ability

    -- Weapon Skills
    elseif spell_type == "WeaponSkill" then
        current_set = sets.midcast["Weapon Skill"]

    -- Songs
    elseif spell_skill == "Singing" then
        if string.find(spell_name, "Paeon") then
            current_set = sets.midcast.Paeon
        elseif string.find(spell_name, "Requiem") then
            current_set = sets.midcast.Requiem
        elseif string.find(spell_name, "Lullaby") then
            current_set = sets.midcast.Lullaby
        elseif string.find(spell_name, "Ballad") then
            current_set = sets.midcast.Ballad
        elseif string.find(spell_name, "Minne") then
            current_set = sets.midcast.Minne
        elseif string.find(spell_name, "Minuet") then
            current_set = sets.midcast.Minuet
        elseif string.find(spell_name, "Madrigal") then
            current_set = sets.midcast.Madrigal
        elseif string.find(spell_name, "Prelude") then
            current_set = sets.midcast.Prelude
        elseif string.find(spell_name, "Mambo") then
            current_set = sets.midcast.Mambo
        elseif string.find(spell_name, "Etude") then
            current_set = sets.midcast.Etude
        elseif string.find(spell_name, "March") then
            current_set = sets.midcast.March
        elseif string.find(spell_name, "Carol") then
            current_set = sets.midcast.Carol
        elseif string.find(spell_name, "Threnody") then
            current_set = sets.midcast.Threnody
        elseif string.find(spell_name, "Finale") then
            current_set = sets.midcast.Finale
        elseif string.find(spell_name, "Mazurka") then
            current_set = sets.midcast.Mazurka
        elseif string.find(spell_name, "Elegy") then
            current_set = sets.midcast.Elegy
        elseif string.find(spell_name, "Virelai") then
            current_set = sets.midcast.Virelai
        else -- General singing
            current_set = sets.midcast.Singing
        end

    elseif spell_action_type == "Magic" then
        if spell_skill == "Healing Magic" then
            if string.find(spell_name, "Cure") then
                current_set = sets.midcast.Cure
            else -- General healing
                current_set = sets.midcast["Healing Magic"]
            end

        -- Enhancing Magic
        elseif spell_skill == "Enhancing Magic" then
            current_set = sets.midcast["Enhancing Magic"]

        -- Blue Magic
        elseif spell_skill == "Blue Magic" then
            current_set = sets.midcast["Blue Magic"]

        -- Dark Magic
        elseif spell_skill == "Dark Magic" then
            current_set = sets.midcast["Dark Magic"]

        -- Divine Magic
        elseif spell_skill == "Divine Magic" then
            if string.find(spell_name, "Banish") then
                current_set = sets.midcast.Banish
            else -- General divine
                current_set = sets.midcast["Divine Magic"]
            end

        -- Enfeebling Magic
        elseif spell_skill == "Enfeebling Magic" then
            current_set = sets.midcast["Enfeebling Magic"]

        -- Summoning Magic
        elseif spell_skill == "Summoning Magic" then
            current_set = sets.midcast["Summoning Magic"]

        -- Geomancy
        elseif spell_skill == "Geomancy" then
            current_set = sets.midcast.Geomancy

        -- Ninjitsu
        elseif spell_skill == "Ninjitsu" then
            current_set = sets.midcast.Ninjitsu

        -- Elemental Magic
        elseif spell_skill == "Elemental Magic" then

            -- Specific spells
            if string.find(spell_name, "Ston") or string.find(spell_name, "Quake") then
                current_set = sets.midcast.Stone
            elseif string.find(spell_name, "Wat") or string.find(spell_name, "Flood") then
                current_set = sets.midcast.Water
            elseif string.find(spell_name, "Aer") or string.find(spell_name, "Tornado") then
                current_set = sets.midcast.Aero
            elseif string.find(spell_name, "Fir") or string.find(spell_name, "Flare") then
                current_set = sets.midcast.Fire
            elseif string.find(spell_name, "Blizz") or string.find(spell_name, "Freeze") then
                current_set = sets.midcast.Blizzard
            elseif string.find(spell_name, "Thund") or string.find(spell_name, "Burst") then
                current_set = sets.midcast.Thunder
            else -- General elemental
                current_set = sets.midcast["Elemental Magic"]
            end
        else -- General magic
            current_set = sets.midcast.Magic
        end
    end
    return combine_alternate(current_set)
end

function sub_job_change(new, old)
    macro_setup()
end

-- Conditionally override the supplied gearset with sets.ALTERNATE
function combine_alternate(gearset)
    if use_alternate then
        return set_combine(gearset, sets.ALTERNATE)
    else
        return gearset
    end
end

-- Equip while factoring alternate override
function equip_with_alternate(gearset)
    equip(combine_alternate(gearset))
end

-- Set current macro and display message
function set_macro(book_num, page_num)
    send_command("input /macro book " .. book_num .. ";wait .1;input /macro set " .. page_num)
    add_to_chat(8, "Setting current macros to book " .. book_num .. ", page " .. page_num)
end
