# Changelog

## [0.2.1](https://github.com/nla/nla-blacklight_common/compare/v0.2.1...0.2.1) (2024-05-14)


### ⚠ BREAKING CHANGES

* merge Blacklight 8 upgrade changes
* separate configuration of users and sessions database
* update Ruby version

### Features

* add concern to reset Blacklight/Arclight search session ([0dd3ffe](https://github.com/nla/nla-blacklight_common/commit/0dd3ffe3d65516416ba6b4cf0268aea1fc3d7ee0))
* add config and links for staff shared Keycloak realm ([c9e217d](https://github.com/nla/nla-blacklight_common/commit/c9e217d9a437d405cfc8eaab0f2e8b90428c824f))
* add helpers to add "active" class to links ([c2fd4c1](https://github.com/nla/nla-blacklight_common/commit/c2fd4c1bf966a311661eb2b3d22188c331163ff8))
* add indicator of type of staff account to username ([d71ab93](https://github.com/nla/nla-blacklight_common/commit/d71ab93d1b3573cadd3943cd484f0bf69d3866de))
* add separate links to staff login realms ([5011201](https://github.com/nla/nla-blacklight_common/commit/5011201d827a6038d8e4d2182625bfa8da1f86e0))
* add session_token to user and refactor backchannel logout ([32d11b3](https://github.com/nla/nla-blacklight_common/commit/32d11b3a67462c8c9a0ffab570f0dfaae26fbea1))
* call auto-renew on patron login ([27050c8](https://github.com/nla/nla-blacklight_common/commit/27050c86ffa91d8a78b6478bfd59cb03559e70fc))
* change patron login to Keycloak via OmniAuth ([aae3900](https://github.com/nla/nla-blacklight_common/commit/aae39003095049f3a681b2ae4e20eeec4b60b7c8))
* clean up unnecessary code ([2fbae47](https://github.com/nla/nla-blacklight_common/commit/2fbae47b1f770be6370813cb05b17b74db2ce526))
* create user account page for logged in patrons ([4fe27b2](https://github.com/nla/nla-blacklight_common/commit/4fe27b2292576947a9e5b3d06cb44a5f32b06025))
* default staff email to empty string if not present ([962cedb](https://github.com/nla/nla-blacklight_common/commit/962cedb4f02117890108dc65c19dcfd4c6031607))
* disable login buttons during FOLIO update ([40ee833](https://github.com/nla/nla-blacklight_common/commit/40ee8335bf194608cc1f3200c45d30c899d26764))
* exclude failed urls when retrying Solr urls ([4585bef](https://github.com/nla/nla-blacklight_common/commit/4585bef8dd85f80109ca031013bd355c64fee739))
* hide 2FA changes behind feature flag ([94c25b2](https://github.com/nla/nla-blacklight_common/commit/94c25b20596b6a494db881de86930c0400c7de1b))
* implement common email 2fa functionality ([b9f9693](https://github.com/nla/nla-blacklight_common/commit/b9f9693058819277acd4f4a348e0a1b6711695b6))
* implement patron login via UserReg ([4a118dc](https://github.com/nla/nla-blacklight_common/commit/4a118dcde7cdf05a4ae850a61cb4296627b3c2e8))
* implement separate Keycloak realms for SOL and SPL login ([f385be1](https://github.com/nla/nla-blacklight_common/commit/f385be13628619a43705132301174c3a372badaa))
* implement staff backchannel logout ([409a61e](https://github.com/nla/nla-blacklight_common/commit/409a61e2dc0742b69b2cd4caf0a00ca56248f03c))
* increase security of session cookie ([c060c6c](https://github.com/nla/nla-blacklight_common/commit/c060c6ca06bc2cd91b14318784a1ca94bda65068))
* merge Blacklight 8 upgrade changes ([3929310](https://github.com/nla/nla-blacklight_common/commit/3929310f1db09f0a3160e2ca523d57276866c450))
* migrate logic and tests ([0d36f70](https://github.com/nla/nla-blacklight_common/commit/0d36f70c27f42672e0762d0ea1b24b706e474b61))
* move GlobalMessageComponent from nla-blacklight ([70eaf3f](https://github.com/nla/nla-blacklight_common/commit/70eaf3f839212febafbcb696dcca248c77934c68))
* move user location and type logic from blacklight ([0b060de](https://github.com/nla/nla-blacklight_common/commit/0b060de00f090c6ba112cfc0b4750539529c87e4))
* only display staff login links in staff network ([25d8834](https://github.com/nla/nla-blacklight_common/commit/25d8834625f89e3ba15e39e14cac32aa1f735cd9))
* overrides "db:sessions" trim and clear tasks ([8154f6f](https://github.com/nla/nla-blacklight_common/commit/8154f6f9b5d583a8b9efbeb664dd1224b3bcf893))
* patron keycloak login page ([bcbd057](https://github.com/nla/nla-blacklight_common/commit/bcbd05704a2a045232286b1ce65edf0562745c00))
* re-implement feature flags ([2cfa3b1](https://github.com/nla/nla-blacklight_common/commit/2cfa3b11e6f45670e1de5a2010fc0a1c3ef0453e))
* refactor SolrCloud repository class ([504736e](https://github.com/nla/nla-blacklight_common/commit/504736e790d44ac02db0c4c83a292085b14bffc7))
* remove scheduler temporarily ([7b54a0d](https://github.com/nla/nla-blacklight_common/commit/7b54a0d07f5ec3e6096be7c12ffe251d8794e3c4))
* rewording of session timeout message ([84287df](https://github.com/nla/nla-blacklight_common/commit/84287df5aaaa72aa8d12dc58e4e48cd61fb94bd3))
* separate configuration of users and sessions database ([4f70555](https://github.com/nla/nla-blacklight_common/commit/4f7055527e34def4d7f855acc2282877bbd89c3f))
* store flag for displaying email 2FA alert ([dd71353](https://github.com/nla/nla-blacklight_common/commit/dd713537715b2ffccc2e81cbbaf35fd1e16a5493))
* style staff login links and localise login text ([a1d3169](https://github.com/nla/nla-blacklight_common/commit/a1d3169deb159e8ed86ccc87a5d1259e0d93fdd0))
* update public patron login error messages ([665e6c2](https://github.com/nla/nla-blacklight_common/commit/665e6c2d805ef7dd6ad2ba813d0f1fadb595deb8))
* update Ruby version ([0074f45](https://github.com/nla/nla-blacklight_common/commit/0074f4510cad95ac5ed65fadb41f495bebd3c4ec))


### Bug Fixes

* add logout endpoint for ebsco ([33540d7](https://github.com/nla/nla-blacklight_common/commit/33540d7bc768bcc7497717ab5dd581efbcc880fa))
* call Keycloak logout endpoint if user inactive ([16ceb66](https://github.com/nla/nla-blacklight_common/commit/16ceb66b789e717691ac8bbe5fd6618a99fe224f))
* change "(Shared)" tag to "(TOL)" ([8d284a4](https://github.com/nla/nla-blacklight_common/commit/8d284a40469e822a97ffd3a74adb12e6cc761d82))
* change "Log in" to "Login" ([27772fe](https://github.com/nla/nla-blacklight_common/commit/27772fec959a55932687f9421e78ea068c9eee72))
* change "Log in" to "Login" ([2d683be](https://github.com/nla/nla-blacklight_common/commit/2d683be3bd117f9f9c124ef64327d6146b7f0e04))
* change login alert wording ([bb4f77e](https://github.com/nla/nla-blacklight_common/commit/bb4f77eef4ebb90e315051238e6a863877ecec24))
* changes login password field to text field ([5689e10](https://github.com/nla/nla-blacklight_common/commit/5689e10dc97c31c448d5d01a07299561baf91c4f))
* correct typos in registration text ([22a5e16](https://github.com/nla/nla-blacklight_common/commit/22a5e161ac497560d6bc8a5de66541d438f98d28))
* fix install generator ([f3055cc](https://github.com/nla/nla-blacklight_common/commit/f3055cc96834b99985e02fffb6b42d1c6c935638))
* fix resolution of modules ([00a3864](https://github.com/nla/nla-blacklight_common/commit/00a3864a561ce2812440639d1765af4ab8723bee))
* fix routes module ([ad09971](https://github.com/nla/nla-blacklight_common/commit/ad099719b862a9286ec79adf195c6bcf504dfa2e))
* fix session destruction and patron login style ([bdc42a9](https://github.com/nla/nla-blacklight_common/commit/bdc42a9d7ec42e53bbd577939b224b9586a59cdb))
* fix setting of solr url ([4cb0254](https://github.com/nla/nla-blacklight_common/commit/4cb0254f7d208af4e6df9b6f2a6fb061cf8a6d0b))
* fix tests in GitHub Actions ([3c0423b](https://github.com/nla/nla-blacklight_common/commit/3c0423b99a13283759a2589b4345bbc0142fdad8))
* fix typo ([779dd0f](https://github.com/nla/nla-blacklight_common/commit/779dd0f49e22cf908a01f4d736b474f47060adf5))
* fixes overridden Devise localisation and password label ([5d2c2a6](https://github.com/nla/nla-blacklight_common/commit/5d2c2a6b3ee297f175ea8f33d6aa1df66a426e37))
* ignore "folio_ext_sys_id" pre-removal from db ([e3dff35](https://github.com/nla/nla-blacklight_common/commit/e3dff356e985994edc5c62b5ce27aa8821be9006))
* make Solr connection timeout earlier ([80fe0e6](https://github.com/nla/nla-blacklight_common/commit/80fe0e6571ec7a7b48ce9d8a6d10c6fcd93f41fe))
* merge user accounts when logging in via Staff/public forms ([f3ea738](https://github.com/nla/nla-blacklight_common/commit/f3ea738661ca84dc372b53cfa29c688cf9bdeb52))
* move flipper-ui into finding-aids scope ([38d7ea6](https://github.com/nla/nla-blacklight_common/commit/38d7ea652f0c0efc4ccce336edd7aa1756d0667e))
* only reset session if matching session found ([f55895e](https://github.com/nla/nla-blacklight_common/commit/f55895ee5e0f8b26710f4d86153a49de81287c9b))
* only use leader nodes in Solr repository ([cd0a235](https://github.com/nla/nla-blacklight_common/commit/cd0a235c3a93df7e7ca1e7a2e899c38fce343b65))
* post login redirect resolution ([af86aff](https://github.com/nla/nla-blacklight_common/commit/af86aff1a38802be3350b359c6a16fc274634b89))
* raise an error if staff login is missing folio_id ([94570bd](https://github.com/nla/nla-blacklight_common/commit/94570bd0c8b38e6947562cc9f99660ae1801e04c))
* reduce memory allocation and clean dependencies ([3dd23e9](https://github.com/nla/nla-blacklight_common/commit/3dd23e9cec8d880e96d1f19995e047e0cd080a67))
* reference correct engine in install generator ([a6a3726](https://github.com/nla/nla-blacklight_common/commit/a6a3726e9890e1a3f41cf8862fd79eda059dd26a))
* remove dependabot updates for npm ([0c9319b](https://github.com/nla/nla-blacklight_common/commit/0c9319b4eafb2820b99c31f3d14860533b93d3b9))
* remove omniauth check for Keycloak login page ([d985edb](https://github.com/nla/nla-blacklight_common/commit/d985edb334d7f0cd0fdda4ce4189f539f66a6aee))
* remove versions from test group ([f27ee91](https://github.com/nla/nla-blacklight_common/commit/f27ee91f06c37e6765ec9d229efbd0766756555c))
* rescue global message fetching timeout ([8bed297](https://github.com/nla/nla-blacklight_common/commit/8bed29750b31f667a4981a7e0752a13fe9e3638d))
* restyle patron login button ([b9f38b2](https://github.com/nla/nla-blacklight_common/commit/b9f38b299625800db6d87e765847b19ccb9494a8))
* store staff FOLIO ID on login ([28d1e23](https://github.com/nla/nla-blacklight_common/commit/28d1e23a1eb5311362663fd950dbd18db14b1e77))
* turn off dotenv.autorestore in test to avoid frozen hash issue ([95dedb3](https://github.com/nla/nla-blacklight_common/commit/95dedb347bd41132dc367d801d8ba7e8eeb71fba))
* update change details from Keycloak on login ([da3bae4](https://github.com/nla/nla-blacklight_common/commit/da3bae447de2c06bab7cb70a51de4730c6882d7d))
* update Rails to fix CVE-2024-26143 ([358c361](https://github.com/nla/nla-blacklight_common/commit/358c361df749b231dc0f2c64c1ff7431e55e5e9a))
* upgrade vulnerable dependencies ([0da807f](https://github.com/nla/nla-blacklight_common/commit/0da807fbd28fa83c79b8068114a2d037dc8ca47a))
* use blacklight config to define ZK host and collection ([b7952f0](https://github.com/nla/nla-blacklight_common/commit/b7952f06ad63fcd6e5e382088d519ef1a77d04ba))


### Reverts

* change to ip lookup ([bf2827c](https://github.com/nla/nla-blacklight_common/commit/bf2827c4182864383091c361b7a2a89695517303))
* move system login and feat flag tests back to features ([a55665c](https://github.com/nla/nla-blacklight_common/commit/a55665c5e789990763c39004fa56ae053e2678bc))
* remove SQL schema changes ([a946d01](https://github.com/nla/nla-blacklight_common/commit/a946d010efe04ab6effdcecf60d6f303edac6f95))


### Documentation

* remove CHANGELOG.md ([40e0a69](https://github.com/nla/nla-blacklight_common/commit/40e0a69831c1f7866fd982c90a9ec4163f1c7264))
* update badges on README.md ([eee0408](https://github.com/nla/nla-blacklight_common/commit/eee0408c6f8bf5a00f4131c09426330d685e1749))
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


### Miscellaneous

* add migration to remove folio_ext_sys_id column ([527e9c2](https://github.com/nla/nla-blacklight_common/commit/527e9c2d9173105275501bb4d63a063032673c43))
* add Simplecov config and remove MIT LICENSE ([19c0ace](https://github.com/nla/nla-blacklight_common/commit/19c0ace08e8cd45eee103fa8344b05eb4d9172e1))
* annotate models with annotate gem ([15a3310](https://github.com/nla/nla-blacklight_common/commit/15a3310447917ed2c05348a995ef18cfc2f51dfc))
* change session cookie security ([6b0b7ec](https://github.com/nla/nla-blacklight_common/commit/6b0b7ec019f84338770c6f14f77493261f32f63b))
* clean up Devise turbo compatibility code ([39f19a6](https://github.com/nla/nla-blacklight_common/commit/39f19a64bebb374172b4b389d82101202125603a))
* cleanup commented code ([43167ee](https://github.com/nla/nla-blacklight_common/commit/43167ee96813298936a8ad80f3d10ab6e4e74bb2))
* **deps-dev:** bump rubocop-rspec from 2.14.0 to 2.15.0 ([75e8c74](https://github.com/nla/nla-blacklight_common/commit/75e8c747fb5c804e22ca341fc4ae537665dc2672))
* **deps-dev:** update standard requirement from ~&gt; 1.16.1 to ~> 1.18.1 ([7a8aa3a](https://github.com/nla/nla-blacklight_common/commit/7a8aa3ad1d24dc31462c54040ebbdf453ac57a42))
* **deps:** bump blacklight from 7.31.0 to 7.32.0 ([d4ab834](https://github.com/nla/nla-blacklight_common/commit/d4ab83465ee9d6ca5b3c317be86b862c4d008675))
* **deps:** bump isbang/compose-action from 1.3.2 to 1.4.1 ([f0c538c](https://github.com/nla/nla-blacklight_common/commit/f0c538ce5b230eb5967723732de7b1677847ca09))
* initial commit ([e3ae9f1](https://github.com/nla/nla-blacklight_common/commit/e3ae9f14575f27283e99a9bc489b4ddd03b61a92))
* initial commit ([4a81a11](https://github.com/nla/nla-blacklight_common/commit/4a81a11065b09d339e377beefaba8f6ebbf9f2e3))
* initial commit ([dc958ae](https://github.com/nla/nla-blacklight_common/commit/dc958aeca8c93c38745bda9c383b893c44bde3a3))
* **main:** release 0.1.0 ([5d55943](https://github.com/nla/nla-blacklight_common/commit/5d5594340983793b8a00c878ccca6870762907a3))
* **main:** release 0.1.0 ([4d8e4e6](https://github.com/nla/nla-blacklight_common/commit/4d8e4e658f5c4fbc93db8983932cb937ee76c3f3))
* **main:** release 0.1.1 ([210760f](https://github.com/nla/nla-blacklight_common/commit/210760f79fa4bd417bd3ebf8b765ab586bbcd60f))
* **main:** release 0.1.10 ([2e9ac5d](https://github.com/nla/nla-blacklight_common/commit/2e9ac5d46b6a8e92fdd0cc3e40b75657f43e104b))
* **main:** release 0.1.11 ([b319228](https://github.com/nla/nla-blacklight_common/commit/b3192284aacd330b53fd7097774e2eef637057db))
* **main:** release 0.1.12 ([cf19cee](https://github.com/nla/nla-blacklight_common/commit/cf19cee5913e4293bc30838488fa409aba0c88b3))
* **main:** release 0.1.2 ([0741aeb](https://github.com/nla/nla-blacklight_common/commit/0741aebba98184e612e8963044b5a24075d64aac))
* **main:** release 0.1.4 ([e6f5ca7](https://github.com/nla/nla-blacklight_common/commit/e6f5ca768e53dd535adc34cacc6e7852a2f99057))
* **main:** release 0.1.5 ([f914407](https://github.com/nla/nla-blacklight_common/commit/f914407069993da381e5f0a24db94d70d4b65d68))
* **main:** release 0.1.6 ([7853e44](https://github.com/nla/nla-blacklight_common/commit/7853e44a4c29cd59a1d89749b3f7a26cc4d801f5))
* **main:** release 0.1.7 ([3a00f60](https://github.com/nla/nla-blacklight_common/commit/3a00f607b23ed5eb29a46ffa33b627061133902e))
* **main:** release 0.1.8 ([18b1d7a](https://github.com/nla/nla-blacklight_common/commit/18b1d7a5e1967745e176035c66508427bba62491))
* **main:** release 0.1.9 ([10c139e](https://github.com/nla/nla-blacklight_common/commit/10c139e47b65697420985a0bb2d4f8bd329ad9cb))
* **main:** release 0.2.0 ([aeb8210](https://github.com/nla/nla-blacklight_common/commit/aeb82105058d9cc0bb17cb78101146b8b005d106))
* **main:** release 0.2.0 ([bf633a4](https://github.com/nla/nla-blacklight_common/commit/bf633a4b630b5b0e4df6d7833890b517f665edd0))
* **main:** release 0.2.1 ([9150afe](https://github.com/nla/nla-blacklight_common/commit/9150afe53b5eb94f797577e8824afbee9c944a8e))
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
* merge changes from main branch ([fb4e493](https://github.com/nla/nla-blacklight_common/commit/fb4e493b5702a31ed94f9f0c21cd2b22602e2dbc))
* merge changes from upstream ([9d9e053](https://github.com/nla/nla-blacklight_common/commit/9d9e053a3b53cfe3a9b8d595102909a525d5a10c))
* merge changes from upstream ([d899e33](https://github.com/nla/nla-blacklight_common/commit/d899e33fe567b147d04b7602294cd5fdae4dca04))
* merge feature flag changes ([dac96ed](https://github.com/nla/nla-blacklight_common/commit/dac96ed1221110f42f39ec4e6ec4e235d037b09a))
* merge from main branch ([da79189](https://github.com/nla/nla-blacklight_common/commit/da791890240be4a5319a2b87dd07e1f3ea7e4c6d))
* merge from main branch ([c315793](https://github.com/nla/nla-blacklight_common/commit/c3157939358f3abfcc5e8a6ad3922b801ee6c115))
* merge from main branch ([46ccb36](https://github.com/nla/nla-blacklight_common/commit/46ccb36bcab42139be65b82785923fe8aa72f52d))
* merge main branch ([3048087](https://github.com/nla/nla-blacklight_common/commit/304808725723106ebbec2b9ee115da930c61a3d3))
* merge patrons ([ddc85d4](https://github.com/nla/nla-blacklight_common/commit/ddc85d4c14474c21460eca1827d2cf87142c9de9))
* merge SolrCloud adaptor ([1ace929](https://github.com/nla/nla-blacklight_common/commit/1ace9293cf630df8d67dcef55ab8581e057a2d61))
* place user routes behind feature flag ([32fe116](https://github.com/nla/nla-blacklight_common/commit/32fe1161e04594ea3d6f7a092f04e33eaeca9bcd))
* release 0.1.0 ([1a4ad5f](https://github.com/nla/nla-blacklight_common/commit/1a4ad5f0e0bf75da800dbbab5a33217abc190833))
* release 3.0.0 ([494c432](https://github.com/nla/nla-blacklight_common/commit/494c4329099a02a0adcef32f50184e316182f1f9))
* **release:** release 0.1.3 ([8f2c8c8](https://github.com/nla/nla-blacklight_common/commit/8f2c8c851b7edf27442eeb1884dc116c2b3c58c8))
* remove commented code ([5043a1c](https://github.com/nla/nla-blacklight_common/commit/5043a1c548495996ce0048a3504bb455526912c3))
* remove keycloak patron login flag ([b6eca1d](https://github.com/nla/nla-blacklight_common/commit/b6eca1dd6a8bd3d252654303aa5e19336d327f34))
* replace annotate_gem with annotaterb ([afdda32](https://github.com/nla/nla-blacklight_common/commit/afdda32c8bfcfa3f4815c54cb249a5d17b1df335))
* rollback previous version increment ([96c01e4](https://github.com/nla/nla-blacklight_common/commit/96c01e480f88c5e265de77fcec607bc963233391))
* set ruby_version directly ([455ee24](https://github.com/nla/nla-blacklight_common/commit/455ee24c9144bf8290193d024cde42af78985b0a))
* update build scripts ([f21ffe5](https://github.com/nla/nla-blacklight_common/commit/f21ffe52f44f70109cbd2cd234ab1290cf0ef8ef))
* update bundler ([8084edd](https://github.com/nla/nla-blacklight_common/commit/8084edddde49f111ef2348e71059fa9c44bcab4d))
* update dependencies ([7ad8e28](https://github.com/nla/nla-blacklight_common/commit/7ad8e28d3cd08c132663986b33784fbd4eea104c))
* update dependencies ([71eea98](https://github.com/nla/nla-blacklight_common/commit/71eea98f4dd051800d2875b0f39f91236647f89a))
* update dependencies ([d8475df](https://github.com/nla/nla-blacklight_common/commit/d8475dfbd724181ec850a8676d8a944a47d4edfe))
* update dependencies ([458f0da](https://github.com/nla/nla-blacklight_common/commit/458f0dab0081ce1c0ff233478572ce016524d713))
* update dependency versions ([25e5a8f](https://github.com/nla/nla-blacklight_common/commit/25e5a8f924ffbc743cd102aa9b82c7e4b6dcdc43))
* update rsolr version declaration ([63558c6](https://github.com/nla/nla-blacklight_common/commit/63558c6d74eb9ca6f1df6c90ca60859603c5d16d))
* update rubocop config ([39e1e69](https://github.com/nla/nla-blacklight_common/commit/39e1e69fc8a8bf5bf1a2aef4c102072a5e378079))
* upgrade Blacklight to 8.0 ([e108e4a](https://github.com/nla/nla-blacklight_common/commit/e108e4afd58ca0cf851f2cda1878a37c5fb0b9e5))
* upgrade dependencies ([8111470](https://github.com/nla/nla-blacklight_common/commit/81114705ead18a1952b5165318a876de62c4729c))
* upgrade dependencies ([669fd6d](https://github.com/nla/nla-blacklight_common/commit/669fd6d2ea38b661f68b03cfb240c018374e5e80))
* upgrade dependencies ([cb68121](https://github.com/nla/nla-blacklight_common/commit/cb68121774f7244316e9f8a88b1f2cae02e12a10))
* upgrade dependencies ([924f047](https://github.com/nla/nla-blacklight_common/commit/924f0472ecaedd61567ff5a0109ea801e43818b4))
* upgrade dependencies ([165a35d](https://github.com/nla/nla-blacklight_common/commit/165a35d1229e81d86e35a9e82d2becd48ec5d819))
* upgrade dependencies ([8659d3f](https://github.com/nla/nla-blacklight_common/commit/8659d3f1a9b8521cf6fd1bcba1c7b644b2b0b279))
* upgrade dependencies ([dd25365](https://github.com/nla/nla-blacklight_common/commit/dd25365881dcc540e281a10553f491d3e37f7916))
* upgrade dependencies ([8a723da](https://github.com/nla/nla-blacklight_common/commit/8a723dac812a4b73b1bed74671cd6933fe2aab05))
* upgrade dependencies and remove irrelevant code in user spec ([fad083b](https://github.com/nla/nla-blacklight_common/commit/fad083b874c53a373cca4548132ab18e9ab0a64f))
* upgrade dependencies and unload unused Rails libraries ([d1c6859](https://github.com/nla/nla-blacklight_common/commit/d1c6859e6a14b4ac80d4883d4426af09c6f443f8))
* upgrade Rails to 7.0.4.2 ([4c426b7](https://github.com/nla/nla-blacklight_common/commit/4c426b7cbfd889ee03eb0017e039372b33ead673))
* upgrade Rails to 7.0.4.2 ([34a5635](https://github.com/nla/nla-blacklight_common/commit/34a5635ca31ed9c90746e9871c516ead7c429f80))
* upgrade to address CVE-2023-28362 ([96ffe16](https://github.com/nla/nla-blacklight_common/commit/96ffe164739918be7058d3729b13ce9ce45cadef))
* upgrade to Ruby 3.2.0 ([0629505](https://github.com/nla/nla-blacklight_common/commit/06295052f1fa478ced87f3cc1d80cf095215ae88))
* upgrade to Ruby 3.2.0 ([fd6125f](https://github.com/nla/nla-blacklight_common/commit/fd6125f37266d650847a3af2d70a2069afe381e9))
* upgrades dependencies to address security vulnerabilities ([e14987a](https://github.com/nla/nla-blacklight_common/commit/e14987ade0116128cbd49d0b376031be3e947a1f))


### Code Refactoring

* change patron auth endpoint ([a56fd3e](https://github.com/nla/nla-blacklight_common/commit/a56fd3e43605bd81c0aba1fc5f4a867f676efc6e))
* changes install generator source_root ([c62d3fb](https://github.com/nla/nla-blacklight_common/commit/c62d3fbe4a7a3ee7dd23264ca823b660d30b895d))
* log Keycloak auth failure and move Devise localisation file here ([801fdbc](https://github.com/nla/nla-blacklight_common/commit/801fdbc259a250c1be3db1e797e7c7e73b291a16))
* make staff login dropdown compatible with bootstrap 5 ([1e0c057](https://github.com/nla/nla-blacklight_common/commit/1e0c05749719863729798a544547d3b91d0115a8))
* refactor IP check and update tests ([4e93884](https://github.com/nla/nla-blacklight_common/commit/4e938849b7493547e3883a5094f531b536b5f701))
* refactor Keycloak integration and add tests ([8af8628](https://github.com/nla/nla-blacklight_common/commit/8af8628e554cb0bc879d24a01e8c7dae3f28f132))
* refactor logout tests to use shared context and examples ([731bd7f](https://github.com/nla/nla-blacklight_common/commit/731bd7fed79f982c9dc0053bb7c264bde34f2b2a))
* refactor repository connection and add test for down leader ([94d7a4f](https://github.com/nla/nla-blacklight_common/commit/94d7a4f2eed7ae6773b235a06a4fc9c8debd1355))
* refactor to use KC_PATRON_REALM as a feature flag ([f66cf16](https://github.com/nla/nla-blacklight_common/commit/f66cf1666ea8624adea734ad96b2d3daf5a3b74c))
* refactors Whitelist class into a Rails model ([21af20a](https://github.com/nla/nla-blacklight_common/commit/21af20a88d0d38e85127cb0a688457d0e563d201))
* reformat login form ([664abb0](https://github.com/nla/nla-blacklight_common/commit/664abb0c640a516e82b6e0232419864d8970d1c7))
* rename ebsco logout to /logout and add test ([12995a8](https://github.com/nla/nla-blacklight_common/commit/12995a89252db8036ce3acee8d23a83b832900d2))
* rename Staff Shared link to Team Official Loan ([0d7148a](https://github.com/nla/nla-blacklight_common/commit/0d7148ad7b9db9ace2590ea6e127ade3e7084b07))
* rewording of login page text ([365493b](https://github.com/nla/nla-blacklight_common/commit/365493b8db214a5a095a0ac4882af8a7e247dbbc))
* style login form input lengths ([e4c7dd6](https://github.com/nla/nla-blacklight_common/commit/e4c7dd61397379fb4d7b2b1aabaa21c9d6368e51))
* update deps, connect only to leader nodes and require error class ([6f1ffa1](https://github.com/nla/nla-blacklight_common/commit/6f1ffa1923b8f21d4ed313af3d11f6932247abfb))
* use "btn-secondary" for staff login links ([505a56b](https://github.com/nla/nla-blacklight_common/commit/505a56ba3efe80166581c0502db1ccda38a3825b))


### Tests

* add bookmark and searches migrations for dummy app ([4987f8b](https://github.com/nla/nla-blacklight_common/commit/4987f8b516115935ae91c36927110e861d462126))
* add feature spec for staff login ([55ad8d2](https://github.com/nla/nla-blacklight_common/commit/55ad8d2a9c6dffc02dfa65fe397906d90d7c58dd))
* add test for patron login upgrade link ([4fd5dd8](https://github.com/nla/nla-blacklight_common/commit/4fd5dd8579ba5e73b92f19bb8d5e9dd5d950d7b3))
* add tests for authentication feature flag ([7f70814](https://github.com/nla/nla-blacklight_common/commit/7f708140aeed156243043925b688508c00b4f55f))
* add tests for staff and backchannel logout ([91923ee](https://github.com/nla/nla-blacklight_common/commit/91923ee1656ec77d88e9c922ba54c1b093d6a9de))
* change rspec format to Fuubar ([f70c92e](https://github.com/nla/nla-blacklight_common/commit/f70c92e0eded1cc1a0e999365843301974fab6c5))
* fix logout tests and dummy app logout ([31acb04](https://github.com/nla/nla-blacklight_common/commit/31acb040bbba9986f22b2302abce4b01805649c4))
* fix test broken by merge ([d44e169](https://github.com/nla/nla-blacklight_common/commit/d44e16937c57ff8698440bd7dcb16e281d6ee37b))
* fix tests config for OmniAuth ([24c53d8](https://github.com/nla/nla-blacklight_common/commit/24c53d8e924338c94f0499481d4b4810c0de0313))
* ignore GALC auth strategy in test coverage ([1b5929b](https://github.com/nla/nla-blacklight_common/commit/1b5929b58937bea5b39872d4f331c6e05fda19c9))
* improve test coverage ([182a68a](https://github.com/nla/nla-blacklight_common/commit/182a68a0aa326c0b894e16aebbb57839913386d6))
* refactor mocks for auth requests ([e6ef656](https://github.com/nla/nla-blacklight_common/commit/e6ef65620e7282cf8b4a25d29664e6e84e24cb7b))
* update test ([21f0417](https://github.com/nla/nla-blacklight_common/commit/21f041713660c9b26b57a6d460ca0033050de636))


### Build System

* **deps-dev:** bump debug from 1.8.0 to 1.9.1 ([17f329c](https://github.com/nla/nla-blacklight_common/commit/17f329c4def45853e622bc17b57e6d02e874795e))
* **deps-dev:** bump factory_bot_rails from 6.4.0 to 6.4.3 ([96a9819](https://github.com/nla/nla-blacklight_common/commit/96a9819843db6ce9670705d32fd11c38d3284627))
* **deps-dev:** bump rdoc from 6.6.2 to 6.6.3.1 ([fb8671e](https://github.com/nla/nla-blacklight_common/commit/fb8671ead2d4eab1cb6dce0dc96b93fda7fd37b5))
* **deps-dev:** bump selenium-webdriver from 4.15.0 to 4.17.0 ([cc54d76](https://github.com/nla/nla-blacklight_common/commit/cc54d76caf23b107a0b7258a76f27f70f051f82a))
* **deps-dev:** bump shoulda-matchers from 5.3.0 to 6.1.0 ([8e6950f](https://github.com/nla/nla-blacklight_common/commit/8e6950f19a09a2d921a25d592e25e42b425aa5cf))
* **deps:** bump actions/checkout from 3 to 4 ([02e8344](https://github.com/nla/nla-blacklight_common/commit/02e834472b540c2275497ec91fa3e2a0878a2760))
* **deps:** bump annotaterb from 4.4.1 to 4.5.0 ([e158c31](https://github.com/nla/nla-blacklight_common/commit/e158c31e61ec54b336de7f00acbb74c72e561131))
* **deps:** bump brakeman from 6.0.1 to 6.1.2 ([6c64c4d](https://github.com/nla/nla-blacklight_common/commit/6c64c4d624f28d456aefbcb9ab0387aab48e04b8))
* **deps:** bump google-github-actions/release-please-action ([0dbf264](https://github.com/nla/nla-blacklight_common/commit/0dbf264630dfca47bf53f55fe1cd6502ce711143))
* **deps:** bump isbang/compose-action from 1.4.1 to 1.5.0 ([a4fe95e](https://github.com/nla/nla-blacklight_common/commit/a4fe95ee662066f62fc22dfa1ce7fbddd0c25768))
* **deps:** bump isbang/compose-action from 1.5.0 to 1.5.1 ([52605e8](https://github.com/nla/nla-blacklight_common/commit/52605e81c492a332f340a21a8fea7b78be6c5535))
* **deps:** bump mysql2 from 0.5.5 to 0.5.6 ([99190b9](https://github.com/nla/nla-blacklight_common/commit/99190b9bfa39fef55a0a7bbb50baa97f510075a8))
* **deps:** bump nokogiri from 1.15.5 to 1.16.2 ([7c818dc](https://github.com/nla/nla-blacklight_common/commit/7c818dce6bcd63b23848559c67049000a11eb4f5))
* **deps:** bump omniauth-keycloak from 1.5.1 to 1.5.2 ([53f9f2a](https://github.com/nla/nla-blacklight_common/commit/53f9f2acae61a70b76d5a994a0535c2364e57a0b))
* ignore CVE-2023-51774 until after release ([374fb27](https://github.com/nla/nla-blacklight_common/commit/374fb278a2938431a1d020bae84ce4410e5f9cdd))
* update bundler version in Gemfile.lock ([fa8326a](https://github.com/nla/nla-blacklight_common/commit/fa8326a046279f97a52b9fc4488dada31ea8a35f))
* update Gemfile.lock after release ([f02565a](https://github.com/nla/nla-blacklight_common/commit/f02565a102a19a61dd36fcdba25e90f4da15ae0b))


### Continuous Integration

* add GitHub actions ([5bfe368](https://github.com/nla/nla-blacklight_common/commit/5bfe3683955e05f881f63fcb37f604acefb42ff1))
* add PAT to release workflow ([e29d142](https://github.com/nla/nla-blacklight_common/commit/e29d142890594ef3804619ea36402689c981bff0))
* adds release workflow ([e2051e5](https://github.com/nla/nla-blacklight_common/commit/e2051e5a4f550e1cc26f147b9b532c064cc0b687))
* adds release workflow ([5685be4](https://github.com/nla/nla-blacklight_common/commit/5685be4b131640052471f19721718390226348be))
* configure redis container for verify workflow ([a65098f](https://github.com/nla/nla-blacklight_common/commit/a65098fb9d950a29928e1f472ba60fac9fe079b9))
* fix dependabot update errors ([60121ab](https://github.com/nla/nla-blacklight_common/commit/60121ab1d0e9717957cf152b73f7cf0195efa967))
* fix Gemfile.lock ([1847cdd](https://github.com/nla/nla-blacklight_common/commit/1847cdd7170cf0bd10bd7ae35f9613a82babd3a8))
* make workflow for alternative releases ([d17c762](https://github.com/nla/nla-blacklight_common/commit/d17c7629c22745da2f11478179c4a2f1d1cc4800))
* modify verify workflow to cache gems ([d501fa6](https://github.com/nla/nla-blacklight_common/commit/d501fa654a87f90b5b506e267097f5a86104f5a5))
* modify workflows ([12b7566](https://github.com/nla/nla-blacklight_common/commit/12b75661ae3021aeb7587adb1a68d7dbf499e45f))
* remove "v" prefix from tag ([e6f99c1](https://github.com/nla/nla-blacklight_common/commit/e6f99c1b38294dc43c9b57aee7556b41ca67ee45))
* replace token for release workflow ([0ffcab6](https://github.com/nla/nla-blacklight_common/commit/0ffcab6e84fbd6f2b5af43ede0e485f92f6ed67c))
* update verify workflow ([689ae0a](https://github.com/nla/nla-blacklight_common/commit/689ae0afa972e18d2a8a8000524895b5e7c2a538))
* update verify workflow ([8310c87](https://github.com/nla/nla-blacklight_common/commit/8310c87fef68b1d60699e3e70ba8ac09741f4724))
* verify pushes/pull requests against release branch ([640ec23](https://github.com/nla/nla-blacklight_common/commit/640ec238aaa5634db9a49c94b8fdd1d2203a5aaf))

## [0.2.1](https://github.com/nla/nla-blacklight_common/compare/0.2.0...0.2.1) (2024-05-08)


### Features

* clean up unnecessary code ([2fbae47](https://github.com/nla/nla-blacklight_common/commit/2fbae47b1f770be6370813cb05b17b74db2ce526))
* hide 2FA changes behind feature flag ([94c25b2](https://github.com/nla/nla-blacklight_common/commit/94c25b20596b6a494db881de86930c0400c7de1b))
* implement common email 2fa functionality ([b9f9693](https://github.com/nla/nla-blacklight_common/commit/b9f9693058819277acd4f4a348e0a1b6711695b6))
* store flag for displaying email 2FA alert ([dd71353](https://github.com/nla/nla-blacklight_common/commit/dd713537715b2ffccc2e81cbbaf35fd1e16a5493))


### Bug Fixes

* fix routes module ([ad09971](https://github.com/nla/nla-blacklight_common/commit/ad099719b862a9286ec79adf195c6bcf504dfa2e))


### Reverts

* remove SQL schema changes ([a946d01](https://github.com/nla/nla-blacklight_common/commit/a946d010efe04ab6effdcecf60d6f303edac6f95))


### Tests

* improve test coverage ([182a68a](https://github.com/nla/nla-blacklight_common/commit/182a68a0aa326c0b894e16aebbb57839913386d6))


### Build System

* **deps-dev:** bump rdoc from 6.6.2 to 6.6.3.1 ([fb8671e](https://github.com/nla/nla-blacklight_common/commit/fb8671ead2d4eab1cb6dce0dc96b93fda7fd37b5))

## [0.2.0](https://github.com/nla/nla-blacklight_common/compare/0.1.12...0.2.0) (2024-03-11)


### ⚠ BREAKING CHANGES

* merge Blacklight 8 upgrade changes

### Features

* merge Blacklight 8 upgrade changes ([3929310](https://github.com/nla/nla-blacklight_common/commit/3929310f1db09f0a3160e2ca523d57276866c450))


### Bug Fixes

* only use leader nodes in Solr repository ([cd0a235](https://github.com/nla/nla-blacklight_common/commit/cd0a235c3a93df7e7ca1e7a2e899c38fce343b65))
* remove dependabot updates for npm ([0c9319b](https://github.com/nla/nla-blacklight_common/commit/0c9319b4eafb2820b99c31f3d14860533b93d3b9))
* remove versions from test group ([f27ee91](https://github.com/nla/nla-blacklight_common/commit/f27ee91f06c37e6765ec9d229efbd0766756555c))
* turn off dotenv.autorestore in test to avoid frozen hash issue ([95dedb3](https://github.com/nla/nla-blacklight_common/commit/95dedb347bd41132dc367d801d8ba7e8eeb71fba))
* update Rails to fix CVE-2024-26143 ([358c361](https://github.com/nla/nla-blacklight_common/commit/358c361df749b231dc0f2c64c1ff7431e55e5e9a))
* upgrade vulnerable dependencies ([0da807f](https://github.com/nla/nla-blacklight_common/commit/0da807fbd28fa83c79b8068114a2d037dc8ca47a))


### Reverts

* change to ip lookup ([bf2827c](https://github.com/nla/nla-blacklight_common/commit/bf2827c4182864383091c361b7a2a89695517303))


### Miscellaneous

* **main:** release 0.1.0 ([5d55943](https://github.com/nla/nla-blacklight_common/commit/5d5594340983793b8a00c878ccca6870762907a3))
* set ruby_version directly ([455ee24](https://github.com/nla/nla-blacklight_common/commit/455ee24c9144bf8290193d024cde42af78985b0a))


### Code Refactoring

* refactor repository connection and add test for down leader ([94d7a4f](https://github.com/nla/nla-blacklight_common/commit/94d7a4f2eed7ae6773b235a06a4fc9c8debd1355))


### Build System

* **deps-dev:** bump debug from 1.8.0 to 1.9.1 ([17f329c](https://github.com/nla/nla-blacklight_common/commit/17f329c4def45853e622bc17b57e6d02e874795e))
* **deps-dev:** bump factory_bot_rails from 6.4.0 to 6.4.3 ([96a9819](https://github.com/nla/nla-blacklight_common/commit/96a9819843db6ce9670705d32fd11c38d3284627))
* **deps-dev:** bump selenium-webdriver from 4.15.0 to 4.17.0 ([cc54d76](https://github.com/nla/nla-blacklight_common/commit/cc54d76caf23b107a0b7258a76f27f70f051f82a))
* **deps-dev:** bump shoulda-matchers from 5.3.0 to 6.1.0 ([8e6950f](https://github.com/nla/nla-blacklight_common/commit/8e6950f19a09a2d921a25d592e25e42b425aa5cf))
* **deps:** bump annotaterb from 4.4.1 to 4.5.0 ([e158c31](https://github.com/nla/nla-blacklight_common/commit/e158c31e61ec54b336de7f00acbb74c72e561131))
* **deps:** bump brakeman from 6.0.1 to 6.1.2 ([6c64c4d](https://github.com/nla/nla-blacklight_common/commit/6c64c4d624f28d456aefbcb9ab0387aab48e04b8))
* **deps:** bump google-github-actions/release-please-action ([0dbf264](https://github.com/nla/nla-blacklight_common/commit/0dbf264630dfca47bf53f55fe1cd6502ce711143))
* **deps:** bump mysql2 from 0.5.5 to 0.5.6 ([99190b9](https://github.com/nla/nla-blacklight_common/commit/99190b9bfa39fef55a0a7bbb50baa97f510075a8))
* **deps:** bump nokogiri from 1.15.5 to 1.16.2 ([7c818dc](https://github.com/nla/nla-blacklight_common/commit/7c818dce6bcd63b23848559c67049000a11eb4f5))
* **deps:** bump omniauth-keycloak from 1.5.1 to 1.5.2 ([53f9f2a](https://github.com/nla/nla-blacklight_common/commit/53f9f2acae61a70b76d5a994a0535c2364e57a0b))
* ignore CVE-2023-51774 until after release ([374fb27](https://github.com/nla/nla-blacklight_common/commit/374fb278a2938431a1d020bae84ce4410e5f9cdd))


### Continuous Integration

* fix dependabot update errors ([60121ab](https://github.com/nla/nla-blacklight_common/commit/60121ab1d0e9717957cf152b73f7cf0195efa967))

## [0.1.0](https://github.com/yetti/nla-blacklight_common/compare/v0.1.5...v0.1.0) (2024-01-23)


### ⚠ BREAKING CHANGES

* separate configuration of users and sessions database
* update Ruby version

### Features

* add concern to reset Blacklight/Arclight search session ([0dd3ffe](https://github.com/yetti/nla-blacklight_common/commit/0dd3ffe3d65516416ba6b4cf0268aea1fc3d7ee0))
* add config and links for staff shared Keycloak realm ([c9e217d](https://github.com/yetti/nla-blacklight_common/commit/c9e217d9a437d405cfc8eaab0f2e8b90428c824f))
* add helpers to add "active" class to links ([c2fd4c1](https://github.com/yetti/nla-blacklight_common/commit/c2fd4c1bf966a311661eb2b3d22188c331163ff8))
* add indicator of type of staff account to username ([d71ab93](https://github.com/yetti/nla-blacklight_common/commit/d71ab93d1b3573cadd3943cd484f0bf69d3866de))
* add separate links to staff login realms ([5011201](https://github.com/yetti/nla-blacklight_common/commit/5011201d827a6038d8e4d2182625bfa8da1f86e0))
* add session_token to user and refactor backchannel logout ([32d11b3](https://github.com/yetti/nla-blacklight_common/commit/32d11b3a67462c8c9a0ffab570f0dfaae26fbea1))
* call auto-renew on patron login ([27050c8](https://github.com/yetti/nla-blacklight_common/commit/27050c86ffa91d8a78b6478bfd59cb03559e70fc))
* change patron login to Keycloak via OmniAuth ([aae3900](https://github.com/yetti/nla-blacklight_common/commit/aae39003095049f3a681b2ae4e20eeec4b60b7c8))
* create user account page for logged in patrons ([4fe27b2](https://github.com/yetti/nla-blacklight_common/commit/4fe27b2292576947a9e5b3d06cb44a5f32b06025))
* default staff email to empty string if not present ([962cedb](https://github.com/yetti/nla-blacklight_common/commit/962cedb4f02117890108dc65c19dcfd4c6031607))
* exclude failed urls when retrying Solr urls ([4585bef](https://github.com/yetti/nla-blacklight_common/commit/4585bef8dd85f80109ca031013bd355c64fee739))
* implement patron login via UserReg ([4a118dc](https://github.com/yetti/nla-blacklight_common/commit/4a118dcde7cdf05a4ae850a61cb4296627b3c2e8))
* implement separate Keycloak realms for SOL and SPL login ([f385be1](https://github.com/yetti/nla-blacklight_common/commit/f385be13628619a43705132301174c3a372badaa))
* implement staff backchannel logout ([409a61e](https://github.com/yetti/nla-blacklight_common/commit/409a61e2dc0742b69b2cd4caf0a00ca56248f03c))
* increase security of session cookie ([c060c6c](https://github.com/yetti/nla-blacklight_common/commit/c060c6ca06bc2cd91b14318784a1ca94bda65068))
* migrate logic and tests ([0d36f70](https://github.com/yetti/nla-blacklight_common/commit/0d36f70c27f42672e0762d0ea1b24b706e474b61))
* move GlobalMessageComponent from nla-blacklight ([70eaf3f](https://github.com/yetti/nla-blacklight_common/commit/70eaf3f839212febafbcb696dcca248c77934c68))
* move user location and type logic from blacklight ([0b060de](https://github.com/yetti/nla-blacklight_common/commit/0b060de00f090c6ba112cfc0b4750539529c87e4))
* only display staff login links in staff network ([25d8834](https://github.com/yetti/nla-blacklight_common/commit/25d8834625f89e3ba15e39e14cac32aa1f735cd9))
* overrides "db:sessions" trim and clear tasks ([8154f6f](https://github.com/yetti/nla-blacklight_common/commit/8154f6f9b5d583a8b9efbeb664dd1224b3bcf893))
* patron keycloak login page ([bcbd057](https://github.com/yetti/nla-blacklight_common/commit/bcbd05704a2a045232286b1ce65edf0562745c00))
* re-implement feature flags ([2cfa3b1](https://github.com/yetti/nla-blacklight_common/commit/2cfa3b11e6f45670e1de5a2010fc0a1c3ef0453e))
* refactor SolrCloud repository class ([504736e](https://github.com/yetti/nla-blacklight_common/commit/504736e790d44ac02db0c4c83a292085b14bffc7))
* remove scheduler temporarily ([7b54a0d](https://github.com/yetti/nla-blacklight_common/commit/7b54a0d07f5ec3e6096be7c12ffe251d8794e3c4))
* rewording of session timeout message ([84287df](https://github.com/yetti/nla-blacklight_common/commit/84287df5aaaa72aa8d12dc58e4e48cd61fb94bd3))
* separate configuration of users and sessions database ([4f70555](https://github.com/yetti/nla-blacklight_common/commit/4f7055527e34def4d7f855acc2282877bbd89c3f))
* style staff login links and localise login text ([a1d3169](https://github.com/yetti/nla-blacklight_common/commit/a1d3169deb159e8ed86ccc87a5d1259e0d93fdd0))
* update public patron login error messages ([665e6c2](https://github.com/yetti/nla-blacklight_common/commit/665e6c2d805ef7dd6ad2ba813d0f1fadb595deb8))
* update Ruby version ([0074f45](https://github.com/yetti/nla-blacklight_common/commit/0074f4510cad95ac5ed65fadb41f495bebd3c4ec))


### Bug Fixes

* add logout endpoint for ebsco ([33540d7](https://github.com/yetti/nla-blacklight_common/commit/33540d7bc768bcc7497717ab5dd581efbcc880fa))
* call Keycloak logout endpoint if user inactive ([16ceb66](https://github.com/yetti/nla-blacklight_common/commit/16ceb66b789e717691ac8bbe5fd6618a99fe224f))
* change "(Shared)" tag to "(TOL)" ([8d284a4](https://github.com/yetti/nla-blacklight_common/commit/8d284a40469e822a97ffd3a74adb12e6cc761d82))
* change "Log in" to "Login" ([27772fe](https://github.com/yetti/nla-blacklight_common/commit/27772fec959a55932687f9421e78ea068c9eee72))
* change "Log in" to "Login" ([2d683be](https://github.com/yetti/nla-blacklight_common/commit/2d683be3bd117f9f9c124ef64327d6146b7f0e04))
* change login alert wording ([bb4f77e](https://github.com/yetti/nla-blacklight_common/commit/bb4f77eef4ebb90e315051238e6a863877ecec24))
* changes login password field to text field ([5689e10](https://github.com/yetti/nla-blacklight_common/commit/5689e10dc97c31c448d5d01a07299561baf91c4f))
* correct typos in registration text ([22a5e16](https://github.com/yetti/nla-blacklight_common/commit/22a5e161ac497560d6bc8a5de66541d438f98d28))
* fix install generator ([f3055cc](https://github.com/yetti/nla-blacklight_common/commit/f3055cc96834b99985e02fffb6b42d1c6c935638))
* fix resolution of modules ([00a3864](https://github.com/yetti/nla-blacklight_common/commit/00a3864a561ce2812440639d1765af4ab8723bee))
* fix session destruction and patron login style ([bdc42a9](https://github.com/yetti/nla-blacklight_common/commit/bdc42a9d7ec42e53bbd577939b224b9586a59cdb))
* fix setting of solr url ([4cb0254](https://github.com/yetti/nla-blacklight_common/commit/4cb0254f7d208af4e6df9b6f2a6fb061cf8a6d0b))
* fix tests in GitHub Actions ([3c0423b](https://github.com/yetti/nla-blacklight_common/commit/3c0423b99a13283759a2589b4345bbc0142fdad8))
* fix typo ([779dd0f](https://github.com/yetti/nla-blacklight_common/commit/779dd0f49e22cf908a01f4d736b474f47060adf5))
* fixes overridden Devise localisation and password label ([5d2c2a6](https://github.com/yetti/nla-blacklight_common/commit/5d2c2a6b3ee297f175ea8f33d6aa1df66a426e37))
* ignore "folio_ext_sys_id" pre-removal from db ([e3dff35](https://github.com/yetti/nla-blacklight_common/commit/e3dff356e985994edc5c62b5ce27aa8821be9006))
* make Solr connection timeout earlier ([80fe0e6](https://github.com/yetti/nla-blacklight_common/commit/80fe0e6571ec7a7b48ce9d8a6d10c6fcd93f41fe))
* merge user accounts when logging in via Staff/public forms ([f3ea738](https://github.com/yetti/nla-blacklight_common/commit/f3ea738661ca84dc372b53cfa29c688cf9bdeb52))
* move flipper-ui into finding-aids scope ([38d7ea6](https://github.com/yetti/nla-blacklight_common/commit/38d7ea652f0c0efc4ccce336edd7aa1756d0667e))
* only reset session if matching session found ([f55895e](https://github.com/yetti/nla-blacklight_common/commit/f55895ee5e0f8b26710f4d86153a49de81287c9b))
* post login redirect resolution ([af86aff](https://github.com/yetti/nla-blacklight_common/commit/af86aff1a38802be3350b359c6a16fc274634b89))
* raise an error if staff login is missing folio_id ([94570bd](https://github.com/yetti/nla-blacklight_common/commit/94570bd0c8b38e6947562cc9f99660ae1801e04c))
* reduce memory allocation and clean dependencies ([3dd23e9](https://github.com/yetti/nla-blacklight_common/commit/3dd23e9cec8d880e96d1f19995e047e0cd080a67))
* reference correct engine in install generator ([a6a3726](https://github.com/yetti/nla-blacklight_common/commit/a6a3726e9890e1a3f41cf8862fd79eda059dd26a))
* remove omniauth check for Keycloak login page ([d985edb](https://github.com/yetti/nla-blacklight_common/commit/d985edb334d7f0cd0fdda4ce4189f539f66a6aee))
* rescue global message fetching timeout ([8bed297](https://github.com/yetti/nla-blacklight_common/commit/8bed29750b31f667a4981a7e0752a13fe9e3638d))
* restyle patron login button ([b9f38b2](https://github.com/yetti/nla-blacklight_common/commit/b9f38b299625800db6d87e765847b19ccb9494a8))
* store staff FOLIO ID on login ([28d1e23](https://github.com/yetti/nla-blacklight_common/commit/28d1e23a1eb5311362663fd950dbd18db14b1e77))
* update change details from Keycloak on login ([da3bae4](https://github.com/yetti/nla-blacklight_common/commit/da3bae447de2c06bab7cb70a51de4730c6882d7d))
* upgrade vulnerable dependencies ([0da807f](https://github.com/yetti/nla-blacklight_common/commit/0da807fbd28fa83c79b8068114a2d037dc8ca47a))
* use blacklight config to define ZK host and collection ([b7952f0](https://github.com/yetti/nla-blacklight_common/commit/b7952f06ad63fcd6e5e382088d519ef1a77d04ba))


### Reverts

* move system login and feat flag tests back to features ([a55665c](https://github.com/yetti/nla-blacklight_common/commit/a55665c5e789990763c39004fa56ae053e2678bc))


### Miscellaneous Chores

* release 0.1.0 ([1a4ad5f](https://github.com/yetti/nla-blacklight_common/commit/1a4ad5f0e0bf75da800dbbab5a33217abc190833))
* release 3.0.0 ([494c432](https://github.com/yetti/nla-blacklight_common/commit/494c4329099a02a0adcef32f50184e316182f1f9))

## [0.1.12](https://github.com/nla/nla-blacklight_common/compare/0.1.11...0.1.12) (2023-11-21)


### Bug Fixes

* add logout endpoint for ebsco ([33540d7](https://github.com/nla/nla-blacklight_common/commit/33540d7bc768bcc7497717ab5dd581efbcc880fa))


### Code Refactoring

* refactor logout tests to use shared context and examples ([731bd7f](https://github.com/nla/nla-blacklight_common/commit/731bd7fed79f982c9dc0053bb7c264bde34f2b2a))
* rename ebsco logout to /logout and add test ([12995a8](https://github.com/nla/nla-blacklight_common/commit/12995a89252db8036ce3acee8d23a83b832900d2))

## [0.1.11](https://github.com/nla/nla-blacklight_common/compare/0.1.10...0.1.11) (2023-11-15)


### Bug Fixes

* call Keycloak logout endpoint if user inactive ([16ceb66](https://github.com/nla/nla-blacklight_common/commit/16ceb66b789e717691ac8bbe5fd6618a99fe224f))
* change login alert wording ([bb4f77e](https://github.com/nla/nla-blacklight_common/commit/bb4f77eef4ebb90e315051238e6a863877ecec24))
* fix typo ([779dd0f](https://github.com/nla/nla-blacklight_common/commit/779dd0f49e22cf908a01f4d736b474f47060adf5))
* only reset session if matching session found ([f55895e](https://github.com/nla/nla-blacklight_common/commit/f55895ee5e0f8b26710f4d86153a49de81287c9b))


### Miscellaneous

* remove keycloak patron login flag ([b6eca1d](https://github.com/nla/nla-blacklight_common/commit/b6eca1dd6a8bd3d252654303aa5e19336d327f34))


### Tests

* fix logout tests and dummy app logout ([31acb04](https://github.com/nla/nla-blacklight_common/commit/31acb040bbba9986f22b2302abce4b01805649c4))

## [0.1.10](https://github.com/nla/nla-blacklight_common/compare/0.1.9...0.1.10) (2023-11-02)


### Code Refactoring

* rewording of login page text ([365493b](https://github.com/nla/nla-blacklight_common/commit/365493b8db214a5a095a0ac4882af8a7e247dbbc))
* use "btn-secondary" for staff login links ([505a56b](https://github.com/nla/nla-blacklight_common/commit/505a56ba3efe80166581c0502db1ccda38a3825b))

## [0.1.9](https://github.com/nla/nla-blacklight_common/compare/0.1.8...0.1.9) (2023-10-19)


### Features

* call auto-renew on patron login ([27050c8](https://github.com/nla/nla-blacklight_common/commit/27050c86ffa91d8a78b6478bfd59cb03559e70fc))
* change patron login to Keycloak via OmniAuth ([aae3900](https://github.com/nla/nla-blacklight_common/commit/aae39003095049f3a681b2ae4e20eeec4b60b7c8))
* patron keycloak login page ([bcbd057](https://github.com/nla/nla-blacklight_common/commit/bcbd05704a2a045232286b1ce65edf0562745c00))


### Bug Fixes

* fix session destruction and patron login style ([bdc42a9](https://github.com/nla/nla-blacklight_common/commit/bdc42a9d7ec42e53bbd577939b224b9586a59cdb))
* remove omniauth check for Keycloak login page ([d985edb](https://github.com/nla/nla-blacklight_common/commit/d985edb334d7f0cd0fdda4ce4189f539f66a6aee))
* restyle patron login button ([b9f38b2](https://github.com/nla/nla-blacklight_common/commit/b9f38b299625800db6d87e765847b19ccb9494a8))


### Miscellaneous

* merge feature flag changes ([dac96ed](https://github.com/nla/nla-blacklight_common/commit/dac96ed1221110f42f39ec4e6ec4e235d037b09a))
* update dependencies ([71eea98](https://github.com/nla/nla-blacklight_common/commit/71eea98f4dd051800d2875b0f39f91236647f89a))
* update dependency versions ([25e5a8f](https://github.com/nla/nla-blacklight_common/commit/25e5a8f924ffbc743cd102aa9b82c7e4b6dcdc43))


### Code Refactoring

* refactor to use KC_PATRON_REALM as a feature flag ([f66cf16](https://github.com/nla/nla-blacklight_common/commit/f66cf1666ea8624adea734ad96b2d3daf5a3b74c))


### Tests

* add test for patron login upgrade link ([4fd5dd8](https://github.com/nla/nla-blacklight_common/commit/4fd5dd8579ba5e73b92f19bb8d5e9dd5d950d7b3))
* fix test broken by merge ([d44e169](https://github.com/nla/nla-blacklight_common/commit/d44e16937c57ff8698440bd7dcb16e281d6ee37b))
* fix tests config for OmniAuth ([24c53d8](https://github.com/nla/nla-blacklight_common/commit/24c53d8e924338c94f0499481d4b4810c0de0313))

## [0.1.8](https://github.com/nla/nla-blacklight_common/compare/0.1.7...0.1.8) (2023-09-19)


### Tests

* change rspec format to Fuubar ([f70c92e](https://github.com/nla/nla-blacklight_common/commit/f70c92e0eded1cc1a0e999365843301974fab6c5))


### Build System

* **deps:** bump actions/checkout from 3 to 4 ([02e8344](https://github.com/nla/nla-blacklight_common/commit/02e834472b540c2275497ec91fa3e2a0878a2760))


### Continuous Integration

* fix Gemfile.lock ([1847cdd](https://github.com/nla/nla-blacklight_common/commit/1847cdd7170cf0bd10bd7ae35f9613a82babd3a8))
* modify verify workflow to cache gems ([d501fa6](https://github.com/nla/nla-blacklight_common/commit/d501fa654a87f90b5b506e267097f5a86104f5a5))

## [0.1.7](https://github.com/nla/nla-blacklight_common/compare/0.1.6...0.1.7) (2023-08-26)


### Miscellaneous

* change session cookie security ([6b0b7ec](https://github.com/nla/nla-blacklight_common/commit/6b0b7ec019f84338770c6f14f77493261f32f63b))

## [0.1.6](https://github.com/nla/nla-blacklight_common/compare/0.1.5...0.1.6) (2023-08-24)


### Bug Fixes

* merge user accounts when logging in via Staff/public forms ([f3ea738](https://github.com/nla/nla-blacklight_common/commit/f3ea738661ca84dc372b53cfa29c688cf9bdeb52))
* reduce memory allocation and clean dependencies ([3dd23e9](https://github.com/nla/nla-blacklight_common/commit/3dd23e9cec8d880e96d1f19995e047e0cd080a67))
* use blacklight config to define ZK host and collection ([b7952f0](https://github.com/nla/nla-blacklight_common/commit/b7952f06ad63fcd6e5e382088d519ef1a77d04ba))


### Miscellaneous

* merge changes from main branch ([fb4e493](https://github.com/nla/nla-blacklight_common/commit/fb4e493b5702a31ed94f9f0c21cd2b22602e2dbc))
* upgrade dependencies ([669fd6d](https://github.com/nla/nla-blacklight_common/commit/669fd6d2ea38b661f68b03cfb240c018374e5e80))


### Build System

* **deps:** bump isbang/compose-action from 1.5.0 to 1.5.1 ([52605e8](https://github.com/nla/nla-blacklight_common/commit/52605e81c492a332f340a21a8fea7b78be6c5535))

## [0.1.5](https://github.com/nla/nla-blacklight_common/compare/0.1.4...0.1.5) (2023-08-09)


### Features

* remove scheduler temporarily ([7b54a0d](https://github.com/nla/nla-blacklight_common/commit/7b54a0d07f5ec3e6096be7c12ffe251d8794e3c4))


### Bug Fixes

* make Solr connection timeout earlier ([80fe0e6](https://github.com/nla/nla-blacklight_common/commit/80fe0e6571ec7a7b48ce9d8a6d10c6fcd93f41fe))
* rescue global message fetching timeout ([8bed297](https://github.com/nla/nla-blacklight_common/commit/8bed29750b31f667a4981a7e0752a13fe9e3638d))


### Miscellaneous

* upgrade dependencies ([cb68121](https://github.com/nla/nla-blacklight_common/commit/cb68121774f7244316e9f8a88b1f2cae02e12a10))

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
