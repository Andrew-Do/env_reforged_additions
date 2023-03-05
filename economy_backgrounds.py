import os
import re
from pathlib import Path

Backgrounds = {}

def isValidFile(root, fname):
    return fname.endswith('.nut')

def addEntry(root, id, value):
    if 'ammo.' in id or 'tool.' in id or 'tools' in root:
        tools[id] = value
    elif 'weapon.' in id:
        weapon[id] = value
    elif 'misc.' in id:
        misc[id] = value
    elif 'accessory.' in id:
        accessory[id] = value
    elif 'supplies.' in id:
        supplies[id] = value
    elif 'shield.' in id:
        shields[id] = value
    elif 'armor.' in id:
        armor[id] = value
    elif 'armor_upgrade.' in id:
        armorUpgrade[id] = value
    else:
        print("WARNING: non-categorized item found", id, value)

def sortTuple(tup):
    # reverse = None (Sorts in Ascending order)
    # key is set to sort using second element of
    # sublist lambda has been used
    return(sorted(tup, key = lambda x: x[1])) 

def parsePrice(root, fname):
    if fname == 'character_background.nut': return
    with open(os.path.join(root, fname)) as file:
        HiringCost = None
        DailyCost = None
        id = None
        Equipment = []
        temp = []

        flag_equip = False
        for line in file.readlines():
            if 'this.m.ID' in line:
                    query = re.findall(r'"(.+?)"', line)[0]
                    id = f'\"{query}\"'
            if 'this.m.HiringCost ' in line:
                if fname == 'slave_background.nut':
                    HiringCost = 190
                else:
                    HiringCost = int(re.findall(r'=(.+)', line)[0].replace(';', '').strip())
            if 'this.m.DailyCost ' in line:
                DailyCost = int(re.findall(r'=(.+)', line)[0].replace(';', '').strip())
            
            #Parse equipment
            if flag_equip:
                if 'this.Math.rand' in line:
                    #start new category
                    if len(temp) > 0:
                        Equipment.append(temp[:])
                        temp.clear()
                if 'this.new("scripts' in line:
                    query = re.findall(r'"(.+?)"', line)[0]
                    script_path = f'\"{query}\"'
                    if not ('equip', script_path) in temp:
                        temp.append(('equip', script_path))

            if 'function onAddEquipment()' in line:
                flag_equip = True
            if flag_equip and line == '\t}\n':
                flag_equip = False
                if len(temp) > 0:
                        Equipment.append(temp[:])
                        temp.clear()
        
        Backgrounds[id] = {
            "HiringCost" : HiringCost,
            "DailyCost" : DailyCost,
            "Equipment" : Equipment
        }

root = r'C:\Files\Projects\bbros\env_reforged\skills\backgrounds'
out = r'C:\Files\Projects\bbros\env_reforged_additions\scripts\config'

for fname in os.listdir(root):
   if not isValidFile(root, fname): continue
   parsePrice(root, fname)
   
      # do your stuff

# Generate background wages - small bug where 2 backgrounds have None hiring cost
# simply just replace in output file

# with open(os.path.join(out, f'Ω_economy_background_wages.nut'), "w+") as f_out:
#     f_out.write('::Const.Backgrounds <- {};\n')
#     f_out.write('::Const.Backgrounds.Equipment <- {};\n')
#     f_out.write('::Const.Backgrounds.Wages <- {\n')
#     for key in Backgrounds:
#         if key == None: continue
#         f_out.write(f'\t{key}' + ' : {\n')
#         f_out.write(f'\t\t"HiringCost" : {Backgrounds[key]["HiringCost"]},\n')
#         f_out.write(f'\t\t"DailyCost" : {Backgrounds[key]["DailyCost"]}\n')
#         f_out.write('\t},\n')

#     f_out.write('};')

lst_backgrounds = []
with open(os.path.join(out, f'Ω_economy_background_wages.nut'), "w+") as f_out:
    for line in f_out.readlines():
        if '"background.' in line:
            query = re.findall(r'"(.+?)"', line)[0]
            id = f'\"{query}\"'
            lst_backgrounds.append(id)
        

# TODO: Refactor code to put in one file
# TODO: handle removing ammo and daggers from lists if bow exists
# TODO: in armor script, add dagger to bag and appropriate ammo for weapon
# TODO: in generation script, do not add shields if 2h
# TODO: in generation script, do not add tools if 2h
# TODO: modify table entries for shields or tools
# for key in Backgrounds:
#     if key == None: continue
#     id = key.replace('background.', '').replace('"', '')
#     with open(os.path.join(out, f'ΩΩ_{id}.nut'), "w+") as f_out:
        
#         f_out.write(f'::Const.Backgrounds.Equipment[{key}]' + ' <- [\n')
#         for i, n in enumerate(Backgrounds[key]["Equipment"]):
#             f_out.write(f'\t[\n')
#             for item in n:
#                 f_out.write(f'\t\t{item[1]},\n')
#             f_out.write(f'\t],\n')

#         f_out.write('];')
            



