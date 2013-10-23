FLASHQUEST_BIZ_NAME = 'FlashQuest'
FLASHQUEST_BRANCH_NAME = 'FlashQuest Setup'

def _bootstrap
  flash_quest = Business.where(name: FLASHQUEST_BIZ_NAME).first_or_create
  flash_quest_branch = flash_quest.branches.where(name: FLASHQUEST_BRANCH_NAME).first_or_create
end

_bootstrap