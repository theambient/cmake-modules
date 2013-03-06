
# GitUtils
#
# CMake module to get various info from git repository
# 
# One of application is to get release version / commit id
# for build / package 
#
# author: Ruslan Mullakhmetov
# date	: 6 Mar 2013

# Gets revision number from specified local git repository (dir)
#
# Git it decentralized SCM system, so there is no explicit revision number
# Instead we assume a number of commits as revision number (at least as a good aproximation)
# This method was suggested by OderWatless in this thread
# http://stackoverflow.com/questions/4120001/what-is-the-git-equivalent-for-revision-number

function( git_revision DIR OUTVAR )

	execute_process ( COMMAND git rev-list HEAD OUTPUT_VARIABLE GIT_REV_LIST_OUTPUT ERROR_VARIABLE GIT_REV_LIST_OUTPUT RESULT_VARIABLE GIT_REV_LIST_RESULT WORKING_DIRECTORY ${DIR} )

	if( NOT ${GIT_REV_LIST_RESULT} EQUAL 0 )
		message( FATAL_ERROR "get_git_revision(): can not get git revision. log followed: ${GIT_REV_LIST_OUTPUT}")
	endif()

	string(STRIP ${GIT_REV_LIST_OUTPUT} GIT_REV_LIST_OUTPUT)
	string(REPLACE "\n" ";" GIT_REV_LIST ${GIT_REV_LIST_OUTPUT} )

	list(LENGTH GIT_REV_LIST RES )
	
	set(${OUTVAR} ${RES} PARENT_SCOPE)

endfunction()

# Gets last commit hash from specified local git repository (dir)

function( git_last_commit_hash DIR OUTVAR )

	execute_process ( COMMAND git rev-list HEAD OUTPUT_VARIABLE GIT_REV_LIST_OUTPUT ERROR_VARIABLE GIT_REV_LIST_OUTPUT RESULT_VARIABLE GIT_REV_LIST_RESULT WORKING_DIRECTORY ${DIR} )

	if( NOT ${GIT_REV_LIST_RESULT} EQUAL 0 )
		message( FATAL_ERROR "get_git_last_commit_hash(): can not get git rev-list. log followed: ${GIT_REV_LIST_OUTPUT}")
	endif()

	string(STRIP ${GIT_REV_LIST_OUTPUT} GIT_REV_LIST_OUTPUT)
	string(REPLACE "\n" ";" GIT_REV_LIST ${GIT_REV_LIST_OUTPUT} )

	list(LENGTH GIT_REV_LIST LEN )
	
	if( ${LEN} EQUAL 0 )
		message( FATAL_ERROR "get_git_last_commit_hash(): empty repository: no commits and nothing to return")
	endif()
	
	list(GET GIT_REV_LIST 0 TOP_COMMIT)
	
	set(${OUTVAR} ${TOP_COMMIT} PARENT_SCOPE)

endfunction()
