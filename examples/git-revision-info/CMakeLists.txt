
cmake_minimum_required( VERSION 2.8 )

project( revtest )

list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/../../modules )

include( GitUtils )

git_revision( ${PROJECT_SOURCE_DIR} GIT_REV_NUM )
git_last_commit_hash( ${PROJECT_SOURCE_DIR} GIT_LAST_COMMIT )

message( STATUS "GIT_LAST_COMMIT: ${GIT_LAST_COMMIT}" )
message( STATUS "GIT_REV_NUM: ${GIT_REV_NUM}" )


