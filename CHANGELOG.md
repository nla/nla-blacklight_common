# Changelog

## [0.1.4](https://github.com/nla/nla-blacklight_common/compare/0.1.3...0.1.4) (2023-07-20)


### Features

* add concern to reset Blacklight/Arclight search session ([0dd3ffe](https://github.com/nla/nla-blacklight_common/commit/0dd3ffe3d65516416ba6b4cf0268aea1fc3d7ee0))
* move GlobalMessageComponent from nla-blacklight ([70eaf3f](https://github.com/nla/nla-blacklight_common/commit/70eaf3f839212febafbcb696dcca248c77934c68))
* rewording of session timeout message ([84287df](https://github.com/nla/nla-blacklight_common/commit/84287df5aaaa72aa8d12dc58e4e48cd61fb94bd3))


### Miscellaneous

* update build scripts ([f21ffe5](https://github.com/nla/nla-blacklight_common/commit/f21ffe52f44f70109cbd2cd234ab1290cf0ef8ef))

## [0.1.3](https://github.com/nla/nla-blacklight_common/compare/0.1.2...0.1.3) (2023-07-12)


### Features

* add helpers to add "active" class to links ([c2fd4c1](https://github.com/nla/nla-blacklight_common/commit/c2fd4c1bf966a311661eb2b3d22188c331163ff8))


### Bug Fixes

* store staff FOLIO ID on login ([28d1e23](https://github.com/nla/nla-blacklight_common/commit/28d1e23a1eb5311362663fd950dbd18db14b1e77))
* update change details from Keycloak on login ([da3bae4](https://github.com/nla/nla-blacklight_common/commit/da3bae447de2c06bab7cb70a51de4730c6882d7d))


### Miscellaneous

* update dependencies ([d8475df](https://github.com/nla/nla-blacklight_common/commit/d8475dfbd724181ec850a8676d8a944a47d4edfe))
* upgrade to address CVE-2023-28362 ([96ffe16](https://github.com/nla/nla-blacklight_common/commit/96ffe164739918be7058d3729b13ce9ce45cadef))

## [0.1.2](https://github.com/nla/nla-blacklight_common/compare/0.1.1...0.1.2) (2023-06-21)


### Bug Fixes

* reference correct engine in install generator ([a6a3726](https://github.com/nla/nla-blacklight_common/commit/a6a3726e9890e1a3f41cf8862fd79eda059dd26a))


### Miscellaneous

* upgrade dependencies ([924f047](https://github.com/nla/nla-blacklight_common/commit/924f0472ecaedd61567ff5a0109ea801e43818b4))

## [0.1.1](https://github.com/nla/nla-blacklight_common/compare/0.1.0...0.1.1) (2023-06-09)


### Documentation

* update badges on README.md ([eee0408](https://github.com/nla/nla-blacklight_common/commit/eee0408c6f8bf5a00f4131c09426330d685e1749))

## 0.1.0 (2023-06-09)


### ⚠ BREAKING CHANGES

* separate configuration of users and sessions database
* update Ruby version

### Features

* add config and links for staff shared Keycloak realm ([c9e217d](https://github.com/nla/nla-blacklight_common/commit/c9e217d9a437d405cfc8eaab0f2e8b90428c824f))
* add indicator of type of staff account to username ([d71ab93](https://github.com/nla/nla-blacklight_common/commit/d71ab93d1b3573cadd3943cd484f0bf69d3866de))
* add separate links to staff login realms ([5011201](https://github.com/nla/nla-blacklight_common/commit/5011201d827a6038d8e4d2182625bfa8da1f86e0))
* add session_token to user and refactor backchannel logout ([32d11b3](https://github.com/nla/nla-blacklight_common/commit/32d11b3a67462c8c9a0ffab570f0dfaae26fbea1))
* create user account page for logged in patrons ([4fe27b2](https://github.com/nla/nla-blacklight_common/commit/4fe27b2292576947a9e5b3d06cb44a5f32b06025))
* default staff email to empty string if not present ([962cedb](https://github.com/nla/nla-blacklight_common/commit/962cedb4f02117890108dc65c19dcfd4c6031607))
* implement patron login via UserReg ([4a118dc](https://github.com/nla/nla-blacklight_common/commit/4a118dcde7cdf05a4ae850a61cb4296627b3c2e8))
* implement separate Keycloak realms for SOL and SPL login ([f385be1](https://github.com/nla/nla-blacklight_common/commit/f385be13628619a43705132301174c3a372badaa))
* implement staff backchannel logout ([409a61e](https://github.com/nla/nla-blacklight_common/commit/409a61e2dc0742b69b2cd4caf0a00ca56248f03c))
* increase security of session cookie ([c060c6c](https://github.com/nla/nla-blacklight_common/commit/c060c6ca06bc2cd91b14318784a1ca94bda65068))
* migrate logic and tests ([0d36f70](https://github.com/nla/nla-blacklight_common/commit/0d36f70c27f42672e0762d0ea1b24b706e474b61))
* move user location and type logic from blacklight ([0b060de](https://github.com/nla/nla-blacklight_common/commit/0b060de00f090c6ba112cfc0b4750539529c87e4))
* only display staff login links in staff network ([25d8834](https://github.com/nla/nla-blacklight_common/commit/25d8834625f89e3ba15e39e14cac32aa1f735cd9))
* overrides "db:sessions" trim and clear tasks ([8154f6f](https://github.com/nla/nla-blacklight_common/commit/8154f6f9b5d583a8b9efbeb664dd1224b3bcf893))
* re-implement feature flags ([2cfa3b1](https://github.com/nla/nla-blacklight_common/commit/2cfa3b11e6f45670e1de5a2010fc0a1c3ef0453e))
* separate configuration of users and sessions database ([4f70555](https://github.com/nla/nla-blacklight_common/commit/4f7055527e34def4d7f855acc2282877bbd89c3f))
* style staff login links and localise login text ([a1d3169](https://github.com/nla/nla-blacklight_common/commit/a1d3169deb159e8ed86ccc87a5d1259e0d93fdd0))
* update public patron login error messages ([665e6c2](https://github.com/nla/nla-blacklight_common/commit/665e6c2d805ef7dd6ad2ba813d0f1fadb595deb8))
* update Ruby version ([0074f45](https://github.com/nla/nla-blacklight_common/commit/0074f4510cad95ac5ed65fadb41f495bebd3c4ec))


### Bug Fixes

* change "(Shared)" tag to "(TOL)" ([8d284a4](https://github.com/nla/nla-blacklight_common/commit/8d284a40469e822a97ffd3a74adb12e6cc761d82))
* change "Log in" to "Login" ([27772fe](https://github.com/nla/nla-blacklight_common/commit/27772fec959a55932687f9421e78ea068c9eee72))
* change "Log in" to "Login" ([2d683be](https://github.com/nla/nla-blacklight_common/commit/2d683be3bd117f9f9c124ef64327d6146b7f0e04))
* changes login password field to text field ([5689e10](https://github.com/nla/nla-blacklight_common/commit/5689e10dc97c31c448d5d01a07299561baf91c4f))
* correct typos in registration text ([22a5e16](https://github.com/nla/nla-blacklight_common/commit/22a5e161ac497560d6bc8a5de66541d438f98d28))
* fix install generator ([f3055cc](https://github.com/nla/nla-blacklight_common/commit/f3055cc96834b99985e02fffb6b42d1c6c935638))
* fix resolution of modules ([00a3864](https://github.com/nla/nla-blacklight_common/commit/00a3864a561ce2812440639d1765af4ab8723bee))
* fix tests in GitHub Actions ([3c0423b](https://github.com/nla/nla-blacklight_common/commit/3c0423b99a13283759a2589b4345bbc0142fdad8))
* fixes overridden Devise localisation and password label ([5d2c2a6](https://github.com/nla/nla-blacklight_common/commit/5d2c2a6b3ee297f175ea8f33d6aa1df66a426e37))
* ignore "folio_ext_sys_id" pre-removal from db ([e3dff35](https://github.com/nla/nla-blacklight_common/commit/e3dff356e985994edc5c62b5ce27aa8821be9006))
* move flipper-ui into finding-aids scope ([38d7ea6](https://github.com/nla/nla-blacklight_common/commit/38d7ea652f0c0efc4ccce336edd7aa1756d0667e))
* post login redirect resolution ([af86aff](https://github.com/nla/nla-blacklight_common/commit/af86aff1a38802be3350b359c6a16fc274634b89))


### Reverts

* move system login and feat flag tests back to features ([a55665c](https://github.com/nla/nla-blacklight_common/commit/a55665c5e789990763c39004fa56ae053e2678bc))


### Build System

* update bundler version in Gemfile.lock ([fa8326a](https://github.com/nla/nla-blacklight_common/commit/fa8326a046279f97a52b9fc4488dada31ea8a35f))
* update Gemfile.lock after release ([f02565a](https://github.com/nla/nla-blacklight_common/commit/f02565a102a19a61dd36fcdba25e90f4da15ae0b))


### Tests

* add bookmark and searches migrations for dummy app ([4987f8b](https://github.com/nla/nla-blacklight_common/commit/4987f8b516115935ae91c36927110e861d462126))
* add feature spec for staff login ([55ad8d2](https://github.com/nla/nla-blacklight_common/commit/55ad8d2a9c6dffc02dfa65fe397906d90d7c58dd))
* add tests for authentication feature flag ([7f70814](https://github.com/nla/nla-blacklight_common/commit/7f708140aeed156243043925b688508c00b4f55f))
* add tests for staff and backchannel logout ([91923ee](https://github.com/nla/nla-blacklight_common/commit/91923ee1656ec77d88e9c922ba54c1b093d6a9de))
* ignore GALC auth strategy in test coverage ([1b5929b](https://github.com/nla/nla-blacklight_common/commit/1b5929b58937bea5b39872d4f331c6e05fda19c9))
* refactor mocks for auth requests ([e6ef656](https://github.com/nla/nla-blacklight_common/commit/e6ef65620e7282cf8b4a25d29664e6e84e24cb7b))
* update test ([21f0417](https://github.com/nla/nla-blacklight_common/commit/21f041713660c9b26b57a6d460ca0033050de636))


### Code Refactoring

* change patron auth endpoint ([a56fd3e](https://github.com/nla/nla-blacklight_common/commit/a56fd3e43605bd81c0aba1fc5f4a867f676efc6e))
* changes install generator source_root ([c62d3fb](https://github.com/nla/nla-blacklight_common/commit/c62d3fbe4a7a3ee7dd23264ca823b660d30b895d))
* log Keycloak auth failure and move Devise localisation file here ([801fdbc](https://github.com/nla/nla-blacklight_common/commit/801fdbc259a250c1be3db1e797e7c7e73b291a16))
* refactor Keycloak integration and add tests ([8af8628](https://github.com/nla/nla-blacklight_common/commit/8af8628e554cb0bc879d24a01e8c7dae3f28f132))
* refactors Whitelist class into a Rails model ([21af20a](https://github.com/nla/nla-blacklight_common/commit/21af20a88d0d38e85127cb0a688457d0e563d201))
* rename Staff Shared link to Team Official Loan ([0d7148a](https://github.com/nla/nla-blacklight_common/commit/0d7148ad7b9db9ace2590ea6e127ade3e7084b07))
* update deps, connect only to leader nodes and require error class ([6f1ffa1](https://github.com/nla/nla-blacklight_common/commit/6f1ffa1923b8f21d4ed313af3d11f6932247abfb))


### Miscellaneous

* add migration to remove folio_ext_sys_id column ([527e9c2](https://github.com/nla/nla-blacklight_common/commit/527e9c2d9173105275501bb4d63a063032673c43))
* add Simplecov config and remove MIT LICENSE ([19c0ace](https://github.com/nla/nla-blacklight_common/commit/19c0ace08e8cd45eee103fa8344b05eb4d9172e1))
* annotate models with annotate gem ([15a3310](https://github.com/nla/nla-blacklight_common/commit/15a3310447917ed2c05348a995ef18cfc2f51dfc))
* clean up Devise turbo compatibility code ([39f19a6](https://github.com/nla/nla-blacklight_common/commit/39f19a64bebb374172b4b389d82101202125603a))
* cleanup commented code ([43167ee](https://github.com/nla/nla-blacklight_common/commit/43167ee96813298936a8ad80f3d10ab6e4e74bb2))
* **deps-dev:** bump rubocop-rspec from 2.14.0 to 2.15.0 ([75e8c74](https://github.com/nla/nla-blacklight_common/commit/75e8c747fb5c804e22ca341fc4ae537665dc2672))
* **deps-dev:** update standard requirement from ~&gt; 1.16.1 to ~> 1.18.1 ([7a8aa3a](https://github.com/nla/nla-blacklight_common/commit/7a8aa3ad1d24dc31462c54040ebbdf453ac57a42))
* **deps:** bump blacklight from 7.31.0 to 7.32.0 ([d4ab834](https://github.com/nla/nla-blacklight_common/commit/d4ab83465ee9d6ca5b3c317be86b862c4d008675))
* **deps:** bump isbang/compose-action from 1.3.2 to 1.4.1 ([f0c538c](https://github.com/nla/nla-blacklight_common/commit/f0c538ce5b230eb5967723732de7b1677847ca09))
* initial commit ([e3ae9f1](https://github.com/nla/nla-blacklight_common/commit/e3ae9f14575f27283e99a9bc489b4ddd03b61a92))
* initial commit ([4a81a11](https://github.com/nla/nla-blacklight_common/commit/4a81a11065b09d339e377beefaba8f6ebbf9f2e3))
* initial commit ([dc958ae](https://github.com/nla/nla-blacklight_common/commit/dc958aeca8c93c38745bda9c383b893c44bde3a3))
* **main:** release 0.2.0 ([bf633a4](https://github.com/nla/nla-blacklight_common/commit/bf633a4b630b5b0e4df6d7833890b517f665edd0))
* **main:** release 0.2.1 ([c1c2b88](https://github.com/nla/nla-blacklight_common/commit/c1c2b8885d9423b6582a33249a06a91cb9be0de5))
* **main:** release 0.2.2 ([94670fc](https://github.com/nla/nla-blacklight_common/commit/94670fc035f74f4105eb518a2a9fa1fc28e751c5))
* **main:** release 0.2.3 ([44ea101](https://github.com/nla/nla-blacklight_common/commit/44ea101120dfcdf4f79f3e728257b95a22218a94))
* **main:** release 1.0.0 ([7b370a0](https://github.com/nla/nla-blacklight_common/commit/7b370a0c1bbf4eddb96e679dba535b6e3d01cf4f))
* **main:** release 1.0.1 ([26ccde5](https://github.com/nla/nla-blacklight_common/commit/26ccde554be07503ac410978ab403732c62c2bf0))
* **main:** release 2.0.0 ([ea714c6](https://github.com/nla/nla-blacklight_common/commit/ea714c6926d25495809cf34af7beff696cc2377b))
* **main:** release 3.0.0 ([38e1459](https://github.com/nla/nla-blacklight_common/commit/38e1459f807875305448876da86e557ffdd8664b))
* **main:** release 3.1.0 ([7de442f](https://github.com/nla/nla-blacklight_common/commit/7de442f23f11f8090725b081982633d9699bf378))
* **main:** release 3.2.0 ([9ad01b7](https://github.com/nla/nla-blacklight_common/commit/9ad01b7efbfb321ddba3a8aff3f86261f086a783))
* make patrons tests pass ([ba51711](https://github.com/nla/nla-blacklight_common/commit/ba51711d4acc017a1d5ada807c30e0585c07c52f))
* merge changes from upstream ([d899e33](https://github.com/nla/nla-blacklight_common/commit/d899e33fe567b147d04b7602294cd5fdae4dca04))
* merge patrons ([ddc85d4](https://github.com/nla/nla-blacklight_common/commit/ddc85d4c14474c21460eca1827d2cf87142c9de9))
* merge SolrCloud adaptor ([1ace929](https://github.com/nla/nla-blacklight_common/commit/1ace9293cf630df8d67dcef55ab8581e057a2d61))
* place user routes behind feature flag ([32fe116](https://github.com/nla/nla-blacklight_common/commit/32fe1161e04594ea3d6f7a092f04e33eaeca9bcd))
* release 0.1.0 ([1a4ad5f](https://github.com/nla/nla-blacklight_common/commit/1a4ad5f0e0bf75da800dbbab5a33217abc190833))
* release 3.0.0 ([494c432](https://github.com/nla/nla-blacklight_common/commit/494c4329099a02a0adcef32f50184e316182f1f9))
* remove commented code ([5043a1c](https://github.com/nla/nla-blacklight_common/commit/5043a1c548495996ce0048a3504bb455526912c3))
* replace annotate_gem with annotaterb ([afdda32](https://github.com/nla/nla-blacklight_common/commit/afdda32c8bfcfa3f4815c54cb249a5d17b1df335))
* update dependencies ([458f0da](https://github.com/nla/nla-blacklight_common/commit/458f0dab0081ce1c0ff233478572ce016524d713))
* update rubocop config ([39e1e69](https://github.com/nla/nla-blacklight_common/commit/39e1e69fc8a8bf5bf1a2aef4c102072a5e378079))
* upgrade dependencies ([165a35d](https://github.com/nla/nla-blacklight_common/commit/165a35d1229e81d86e35a9e82d2becd48ec5d819))
* upgrade dependencies ([8659d3f](https://github.com/nla/nla-blacklight_common/commit/8659d3f1a9b8521cf6fd1bcba1c7b644b2b0b279))
* upgrade dependencies ([dd25365](https://github.com/nla/nla-blacklight_common/commit/dd25365881dcc540e281a10553f491d3e37f7916))
* upgrade dependencies ([8a723da](https://github.com/nla/nla-blacklight_common/commit/8a723dac812a4b73b1bed74671cd6933fe2aab05))
* upgrade Rails to 7.0.4.2 ([4c426b7](https://github.com/nla/nla-blacklight_common/commit/4c426b7cbfd889ee03eb0017e039372b33ead673))
* upgrade Rails to 7.0.4.2 ([34a5635](https://github.com/nla/nla-blacklight_common/commit/34a5635ca31ed9c90746e9871c516ead7c429f80))
* upgrade to Ruby 3.2.0 ([0629505](https://github.com/nla/nla-blacklight_common/commit/06295052f1fa478ced87f3cc1d80cf095215ae88))
* upgrade to Ruby 3.2.0 ([fd6125f](https://github.com/nla/nla-blacklight_common/commit/fd6125f37266d650847a3af2d70a2069afe381e9))
* upgrades dependencies to address security vulnerabilities ([e14987a](https://github.com/nla/nla-blacklight_common/commit/e14987ade0116128cbd49d0b376031be3e947a1f))


### Continuous Integration

* add GitHub actions ([5bfe368](https://github.com/nla/nla-blacklight_common/commit/5bfe3683955e05f881f63fcb37f604acefb42ff1))
* add PAT to release workflow ([e29d142](https://github.com/nla/nla-blacklight_common/commit/e29d142890594ef3804619ea36402689c981bff0))
* adds release workflow ([e2051e5](https://github.com/nla/nla-blacklight_common/commit/e2051e5a4f550e1cc26f147b9b532c064cc0b687))
* adds release workflow ([5685be4](https://github.com/nla/nla-blacklight_common/commit/5685be4b131640052471f19721718390226348be))
* configure redis container for verify workflow ([a65098f](https://github.com/nla/nla-blacklight_common/commit/a65098fb9d950a29928e1f472ba60fac9fe079b9))
* make workflow for alternative releases ([d17c762](https://github.com/nla/nla-blacklight_common/commit/d17c7629c22745da2f11478179c4a2f1d1cc4800))
* modify workflows ([12b7566](https://github.com/nla/nla-blacklight_common/commit/12b75661ae3021aeb7587adb1a68d7dbf499e45f))
* remove "v" prefix from tag ([e6f99c1](https://github.com/nla/nla-blacklight_common/commit/e6f99c1b38294dc43c9b57aee7556b41ca67ee45))
* replace token for release workflow ([0ffcab6](https://github.com/nla/nla-blacklight_common/commit/0ffcab6e84fbd6f2b5af43ede0e485f92f6ed67c))
* update verify workflow ([689ae0a](https://github.com/nla/nla-blacklight_common/commit/689ae0afa972e18d2a8a8000524895b5e7c2a538))
* update verify workflow ([8310c87](https://github.com/nla/nla-blacklight_common/commit/8310c87fef68b1d60699e3e70ba8ac09741f4724))
* verify pushes/pull requests against release branch ([640ec23](https://github.com/nla/nla-blacklight_common/commit/640ec238aaa5634db9a49c94b8fdd1d2203a5aaf))


### Documentation

* remove CHANGELOG.md ([40e0a69](https://github.com/nla/nla-blacklight_common/commit/40e0a69831c1f7866fd982c90a9ec4163f1c7264))
* update model annotations ([a512fcb](https://github.com/nla/nla-blacklight_common/commit/a512fcba89e98f5f6017f78be58e5ac9eaa2dec8))
* update README.md ([dfe0720](https://github.com/nla/nla-blacklight_common/commit/dfe0720ed0906e2da36b71c1b60dd98d14f5cfa8))
* update README.md ([cf3e281](https://github.com/nla/nla-blacklight_common/commit/cf3e281436b0dc234fdc45371d57acc5d42196d2))
* update README.md ([66def80](https://github.com/nla/nla-blacklight_common/commit/66def80d80de63ab389c3d5118d4c0b43615ab3e))
* update README.md ([468631d](https://github.com/nla/nla-blacklight_common/commit/468631d7b337af245a3c1a9596daca8b2772ff97))
* update README.md badge links ([37655cb](https://github.com/nla/nla-blacklight_common/commit/37655cb2c3012821dbd80b9a30756e6b076a1c67))
* update README.md badge links ([6be178f](https://github.com/nla/nla-blacklight_common/commit/6be178f6ea85eb0d2409f9faaa162f945adf3908))
* updates README.md ([b27e742](https://github.com/nla/nla-blacklight_common/commit/b27e742564bfa93ab4fe0a59f4adeba65cef0263))
* updates README.md ([289d720](https://github.com/nla/nla-blacklight_common/commit/289d720ca78bcc8cbeeb802bb5537ea18edbc843))
* updates README.md and adds sample database config ([7c87e41](https://github.com/nla/nla-blacklight_common/commit/7c87e416efb7ed667feba0944bf8b5b991c0f75c))
* updates README.md and install generator USAGE ([566422e](https://github.com/nla/nla-blacklight_common/commit/566422ec57624b9172d92566fb7d41003d0a5f67))
