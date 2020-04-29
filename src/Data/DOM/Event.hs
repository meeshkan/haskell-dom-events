module Data.DOM.Event(
  AnimationEvent(..),
  BlobEvent(..),
  ClipboardEvent(..),
  CloseEvent(..),
  CompositionEvent(..),
  DragEvent(..),
  ErrorEvent(..),
  FetchEvent(..),
  FocusEvent(..),
  InputEvent(..),
  KeyboardEvent(..),
  MouseEvent(..),
  PageTransitionEvent(..),
  PointerEvent(..),
  ProgressEvent(..),
  SVGEvent(..),
  TouchEvent(..),
  TrackEvent(..)
) where

import           Data.HashMap.Strict
import           Data.Text

data AnimationEvent s cp pd sp sip = AnimationEvent
    { _animationEvent_animationName            :: Maybe Text
    , _animationEvent_elapsedTime              :: Maybe Double
    , _animationEvent_pseudoElement            :: Maybe Text
    -- from Event
    , _animationEvent_bubbles                  :: Maybe Bool
    , _animationEvent_cancelBubble             :: Maybe Bool
    , _animationEvent_cancelable               :: Maybe Bool
    , _animationEvent_composed                 :: Maybe Bool
    , _animationEvent_currentTarget            :: Maybe s
    , _animationEvent_deepPath                 :: Maybe [s]
    , _animationEvent_defaultPrevented         :: Maybe Bool
    , _animationEvent_eventPhase               :: Maybe Int
    , _animationEvent_explicitOriginalTarget   :: Maybe s
    , _animationEvent_originalTarget           :: Maybe s
    , _animationEvent_returnValue              :: Maybe Bool
    , _animationEvent_srcElement               :: Maybe s
    , _animationEvent_target                   :: Maybe s
    , _animationEvent_timeStamp                :: Maybe Int
    , _animationEvent_type                     :: Maybe Text
    , _animationEvent_isTrusted                :: Maybe Bool
    , _animationEvent_scoped                   :: Maybe Bool
    , _animationEvent_composedPath             :: Maybe cp
    , _animationEvent_preventDefault           :: Maybe pd
    , _animationEvent_stopPropagation          :: Maybe sp
    , _animationEvent_stopImmediatePropagation :: Maybe sip
    }

data Blob a s t = Blob
    { _blob_arrayBuffer :: a
    , _blob_stream      :: s
    , _blob_text        :: t
    , _blob_type        :: Text
    , _blob_size        :: Int
    }

data File a s t = File
    { _file_lastModified       :: Int
    , _file_name               :: Text
    , _file_webkitRelativePath :: Maybe Text
    -- from Blob
    , _file_arrayBuffer        :: a
    , _file_stream             :: s
    , _file_text               :: t
    , _file_type               :: Text
    , _file_size               :: Int
    }

data BlobEvent ab st tx s cp pd sp sip = BlobEvent
    { _blobEvent_data                     :: Maybe (Blob ab st tx)
    , _blobEvent_timecode                 :: Maybe Double
    -- from Event
    , _blobEvent_bubbles                  :: Maybe Bool
    , _blobEvent_cancelBubble             :: Maybe Bool
    , _blobEvent_cancelable               :: Maybe Bool
    , _blobEvent_composed                 :: Maybe Bool
    , _blobEvent_currentTarget            :: Maybe s
    , _blobEvent_deepPath                 :: Maybe [s]
    , _blobEvent_defaultPrevented         :: Maybe Bool
    , _blobEvent_eventPhase               :: Maybe Int
    , _blobEvent_explicitOriginalTarget   :: Maybe s
    , _blobEvent_originalTarget           :: Maybe s
    , _blobEvent_returnValue              :: Maybe Bool
    , _blobEvent_srcElement               :: Maybe s
    , _blobEvent_target                   :: Maybe s
    , _blobEvent_timeStamp                :: Maybe Int
    , _blobEvent_type                     :: Maybe Text
    , _blobEvent_isTrusted                :: Maybe Bool
    , _blobEvent_scoped                   :: Maybe Bool
    , _blobEvent_composedPath             :: Maybe cp
    , _blobEvent_preventDefault           :: Maybe pd
    , _blobEvent_stopPropagation          :: Maybe sp
    , _blobEvent_stopImmediatePropagation :: Maybe sip
    }

data DropEffect = DropEffectNone
    | DropEffectCopy
    | DropEffectLink
    | DropEffectMove
data EffectAllowed = EffectAllowedNone
    | EffectAllowedCopy
    | EffectAllowedCopyLink
    | EffectAllowedCopyMove
    | EffectAllowedLink
    | EffectAllowedLinkMove
    | EffectAllowedMove
    | EffectAllowedAll
    | EffectAllowedUninitialized

data DataTransfer a s t = DataTransfer
    { dropEffect    :: DropEffect
    , effectAllowed :: EffectAllowed
    , files         :: [File a s t]
    , items         :: [DataTransfer a s t]
    , types         :: [Text]
    }

data ClipboardEvent s cp pd sp sip ab st tx = ClipboardEvent
    { _clipboardEvent_clipboardData            :: Maybe (DataTransfer ab st tx)
    -- from Event
    , _clipboardEvent_bubbles                  :: Maybe Bool
    , _clipboardEvent_cancelBubble             :: Maybe Bool
    , _clipboardEvent_cancelable               :: Maybe Bool
    , _clipboardEvent_composed                 :: Maybe Bool
    , _clipboardEvent_currentTarget            :: Maybe s
    , _clipboardEvent_deepPath                 :: Maybe [s]
    , _clipboardEvent_defaultPrevented         :: Maybe Bool
    , _clipboardEvent_eventPhase               :: Maybe Int
    , _clipboardEvent_explicitOriginalTarget   :: Maybe s
    , _clipboardEvent_originalTarget           :: Maybe s
    , _clipboardEvent_returnValue              :: Maybe Bool
    , _clipboardEvent_srcElement               :: Maybe s
    , _clipboardEvent_target                   :: Maybe s
    , _clipboardEvent_timeStamp                :: Maybe Int
    , _clipboardEvent_type                     :: Maybe Text
    , _clipboardEvent_isTrusted                :: Maybe Bool
    , _clipboardEvent_scoped                   :: Maybe Bool
    , _clipboardEvent_composedPath             :: Maybe cp
    , _clipboardEvent_preventDefault           :: Maybe pd
    , _clipboardEvent_stopPropagation          :: Maybe sp
    , _clipboardEvent_stopImmediatePropagation :: Maybe sip
    }

data CloseEvent s cp pd sp sip = CloseEvent
    { _closeEvent_code                     :: Maybe Int
    , _closeEvent_reason                   :: Maybe Text
    , _closeEvent_wasClean                 :: Maybe Bool
    -- from Event
    , _closeEvent_bubbles                  :: Maybe Bool
    , _closeEvent_cancelBubble             :: Maybe Bool
    , _closeEvent_cancelable               :: Maybe Bool
    , _closeEvent_composed                 :: Maybe Bool
    , _closeEvent_currentTarget            :: Maybe s
    , _closeEvent_deepPath                 :: Maybe [s]
    , _closeEvent_defaultPrevented         :: Maybe Bool
    , _closeEvent_eventPhase               :: Maybe Int
    , _closeEvent_explicitOriginalTarget   :: Maybe s
    , _closeEvent_originalTarget           :: Maybe s
    , _closeEvent_returnValue              :: Maybe Bool
    , _closeEvent_srcElement               :: Maybe s
    , _closeEvent_target                   :: Maybe s
    , _closeEvent_timeStamp                :: Maybe Int
    , _closeEvent_type                     :: Maybe Text
    , _closeEvent_isTrusted                :: Maybe Bool
    , _closeEvent_scoped                   :: Maybe Bool
    , _closeEvent_composedPath             :: Maybe cp
    , _closeEvent_preventDefault           :: Maybe pd
    , _closeEvent_stopPropagation          :: Maybe sp
    , _closeEvent_stopImmediatePropagation :: Maybe sip
    }

data CompositionEvent s cp pd sp sip = CompositionEvent
    { _compositionEvent_data                     :: Maybe Text
    , _compositionEvent_locale                   :: Maybe Text
    -- from UIEvent
    , _compositionEvent_detail                   :: Maybe Int
    -- from Event
    , _compositionEvent_bubbles                  :: Maybe Bool
    , _compositionEvent_cancelBubble             :: Maybe Bool
    , _compositionEvent_cancelable               :: Maybe Bool
    , _compositionEvent_composed                 :: Maybe Bool
    , _compositionEvent_currentTarget            :: Maybe s
    , _compositionEvent_deepPath                 :: Maybe [s]
    , _compositionEvent_defaultPrevented         :: Maybe Bool
    , _compositionEvent_eventPhase               :: Maybe Int
    , _compositionEvent_explicitOriginalTarget   :: Maybe s
    , _compositionEvent_originalTarget           :: Maybe s
    , _compositionEvent_returnValue              :: Maybe Bool
    , _compositionEvent_srcElement               :: Maybe s
    , _compositionEvent_target                   :: Maybe s
    , _compositionEvent_timeStamp                :: Maybe Int
    , _compositionEvent_type                     :: Maybe Text
    , _compositionEvent_isTrusted                :: Maybe Bool
    , _compositionEvent_scoped                   :: Maybe Bool
    , _compositionEvent_composedPath             :: Maybe cp
    , _compositionEvent_preventDefault           :: Maybe pd
    , _compositionEvent_stopPropagation          :: Maybe sp
    , _compositionEvent_stopImmediatePropagation :: Maybe sip
    }

data DragEvent ab st tx gms s cp pd sp sip = DragEvent
    { _dragEvent_dataTransfer             :: Maybe (DataTransfer ab st tx)
    -- from MouseEvent
    , _dragEvent_altKey                   :: Maybe Bool
    , _dragEvent_button                   :: Maybe Int
    , _dragEvent_buttons                  :: Maybe [Int]
    , _dragEvent_clientX                  :: Maybe Int
    , _dragEvent_clientY                  :: Maybe Int
    , _dragEvent_ctrlKey                  :: Maybe Bool
    , _dragEvent_metaKey                  :: Maybe Bool
    , _dragEvent_movementX                :: Maybe Int
    , _dragEvent_movementY                :: Maybe Int
    , _dragEvent_offsetX                  :: Maybe Int
    , _dragEvent_offsetY                  :: Maybe Int
    , _dragEvent_pageX                    :: Maybe Int
    , _dragEvent_pageY                    :: Maybe Int
    , _dragEvent_region                   :: Maybe Text
    , _dragEvent_relatedTarget            :: Maybe s
    , _dragEvent_screenX                  :: Maybe Int
    , _dragEvent_screenY                  :: Maybe Int
    , _dragEvent_shiftKey                 :: Maybe Bool
    , _dragEvent_which                    :: Maybe Int
    , _dragEvent_getModifierState         :: Maybe gms
    -- from UIEvent
    , _dragEvent_detail                   :: Maybe Int
    -- from Event
    , _dragEvent_bubbles                  :: Maybe Bool
    , _dragEvent_cancelBubble             :: Maybe Bool
    , _dragEvent_cancelable               :: Maybe Bool
    , _dragEvent_composed                 :: Maybe Bool
    , _dragEvent_currentTarget            :: Maybe s
    , _dragEvent_deepPath                 :: Maybe [s]
    , _dragEvent_defaultPrevented         :: Maybe Bool
    , _dragEvent_eventPhase               :: Maybe Int
    , _dragEvent_explicitOriginalTarget   :: Maybe s
    , _dragEvent_originalTarget           :: Maybe s
    , _dragEvent_returnValue              :: Maybe Bool
    , _dragEvent_srcElement               :: Maybe s
    , _dragEvent_target                   :: Maybe s
    , _dragEvent_timeStamp                :: Maybe Int
    , _dragEvent_type                     :: Maybe Text
    , _dragEvent_isTrusted                :: Maybe Bool
    , _dragEvent_scoped                   :: Maybe Bool
    , _dragEvent_composedPath             :: Maybe cp
    , _dragEvent_preventDefault           :: Maybe pd
    , _dragEvent_stopPropagation          :: Maybe sp
    , _dragEvent_stopImmediatePropagation :: Maybe sip
    }

data ErrorEvent s cp pd sp sip = ErrorEvent
    { _errorEvent_message                  :: Maybe Text
    , _errorEvent_filename                 :: Maybe Text
    , _errorEvent_lineno                   :: Maybe Int
    , _errorEvent_colno                    :: Maybe Int
    , _errorEvent_error                    :: Maybe s
    -- from Event
    , _errorEvent_bubbles                  :: Maybe Bool
    , _errorEvent_cancelBubble             :: Maybe Bool
    , _errorEvent_cancelable               :: Maybe Bool
    , _errorEvent_composed                 :: Maybe Bool
    , _errorEvent_currentTarget            :: Maybe s
    , _errorEvent_deepPath                 :: Maybe [s]
    , _errorEvent_defaultPrevented         :: Maybe Bool
    , _errorEvent_eventPhase               :: Maybe Int
    , _errorEvent_explicitOriginalTarget   :: Maybe s
    , _errorEvent_originalTarget           :: Maybe s
    , _errorEvent_returnValue              :: Maybe Bool
    , _errorEvent_srcElement               :: Maybe s
    , _errorEvent_target                   :: Maybe s
    , _errorEvent_timeStamp                :: Maybe Int
    , _errorEvent_type                     :: Maybe Text
    , _errorEvent_isTrusted                :: Maybe Bool
    , _errorEvent_scoped                   :: Maybe Bool
    , _errorEvent_composedPath             :: Maybe cp
    , _errorEvent_preventDefault           :: Maybe pd
    , _errorEvent_stopPropagation          :: Maybe sp
    , _errorEvent_stopImmediatePropagation :: Maybe sip
    }

data RequestCache = CacheNone
    | CacheReload
    | CacheNoCache
data RequestCredentials = CredentialOmit
    | CredentialSameOrigin
    | CredentialInclude
data RequestRedirect = RedirectFollow
    | RedirectError
    | RedirectManual

data Request s = Request
    { _request_cache       :: Maybe RequestCache
    , _request_context     :: Maybe Text
    , _request_credentials :: Maybe RequestCredentials
    , _request_destination :: Maybe Text
    , _request_headers     :: Maybe (HashMap Text Text)
    , _request_integrity   :: Maybe Text
    , _request_method      :: Maybe Text
    , _request_redirect    :: Maybe RequestRedirect
    , _request_referrer    :: Maybe Text
    , _request_url         :: Maybe Text
    , _request_body        :: Maybe s
    , _request_bodyUsed    :: Maybe Bool
    }

data FetchEvent p st s cp pd sp sip = FetchEvent
    { _fetchEvent_clientId                 :: Maybe Text
    , _fetchEvent_preloadResponse          :: Maybe p
    , _fetchEvent_replacesClientId         :: Maybe Text
    , _fetchEvent_resultingClientId        :: Maybe Text
    , _fetchEvent_request                  :: Maybe (Request st)
    -- from Event
    , _fetchEvent_bubbles                  :: Maybe Bool
    , _fetchEvent_cancelBubble             :: Maybe Bool
    , _fetchEvent_cancelable               :: Maybe Bool
    , _fetchEvent_composed                 :: Maybe Bool
    , _fetchEvent_currentTarget            :: Maybe s
    , _fetchEvent_deepPath                 :: Maybe [s]
    , _fetchEvent_defaultPrevented         :: Maybe Bool
    , _fetchEvent_eventPhase               :: Maybe Int
    , _fetchEvent_explicitOriginalTarget   :: Maybe s
    , _fetchEvent_originalTarget           :: Maybe s
    , _fetchEvent_returnValue              :: Maybe Bool
    , _fetchEvent_srcElement               :: Maybe s
    , _fetchEvent_target                   :: Maybe s
    , _fetchEvent_timeStamp                :: Maybe Int
    , _fetchEvent_type                     :: Maybe Text
    , _fetchEvent_isTrusted                :: Maybe Bool
    , _fetchEvent_scoped                   :: Maybe Bool
    , _fetchEvent_composedPath             :: Maybe cp
    , _fetchEvent_preventDefault           :: Maybe pd
    , _fetchEvent_stopPropagation          :: Maybe sp
    , _fetchEvent_stopImmediatePropagation :: Maybe sip
    }

data FocusEvent s cp pd sp sip = FocusEvent
    { _focusEvent_relatedTarget            :: Maybe s
    -- from UIEvent
    , _focusEvent_detail                   :: Maybe Int
    -- from Event
    , _focusEvent_bubbles                  :: Maybe Bool
    , _focusEvent_cancelBubble             :: Maybe Bool
    , _focusEvent_cancelable               :: Maybe Bool
    , _focusEvent_composed                 :: Maybe Bool
    , _focusEvent_currentTarget            :: Maybe s
    , _focusEvent_deepPath                 :: Maybe [s]
    , _focusEvent_defaultPrevented         :: Maybe Bool
    , _focusEvent_eventPhase               :: Maybe Int
    , _focusEvent_explicitOriginalTarget   :: Maybe s
    , _focusEvent_originalTarget           :: Maybe s
    , _focusEvent_returnValue              :: Maybe Bool
    , _focusEvent_srcElement               :: Maybe s
    , _focusEvent_target                   :: Maybe s
    , _focusEvent_timeStamp                :: Maybe Int
    , _focusEvent_type                     :: Maybe Text
    , _focusEvent_isTrusted                :: Maybe Bool
    , _focusEvent_scoped                   :: Maybe Bool
    , _focusEvent_composedPath             :: Maybe cp
    , _focusEvent_preventDefault           :: Maybe pd
    , _focusEvent_stopPropagation          :: Maybe sp
    , _focusEvent_stopImmediatePropagation :: Maybe sip
    }

data InputType = InsertText
    | InsertReplacementText
    | InsertLineBreak
    | InsertParagraph
    | InsertOrderedList
    | InsertUnorderedList
    | InsertHorizontalRule
    | InsertFromYank
    | InsertFromDrop
    | InsertFromPaste
    | InsertFromPasteAsQuotation
    | InsertTranspose
    | InsertCompositionText
    | InsertLink
    | DeleteWordBackward
    | DeleteWordForward
    | DeleteSoftLineBackward
    | DeleteSoftLineForward
    | DeleteEntireSoftLine
    | DeleteHardLineBackward
    | DeleteHardLineForward
    | DeleteByDrag
    | DeleteByCut
    | DeleteContent
    | DeleteContentBackward
    | DeleteContentForward
    | HistoryUndo
    | HistoryRedo
    | FormatBold
    | FormatItalic
    | FormatUnderline
    | FormatStrikeThrough
    | FormatSuperscript
    | FormatSubscript
    | FormatJustifyFull
    | FormatJustifyCenter
    | FormatJustifyRight
    | FormatJustifyLeft
    | FormatIndent
    | FormatOutdent
    | FormatRemove
    | FormatSetBlockTextDirection
    | FormatSetInlineTextDirection
    | FormatBackColor
    | FormatFontColor
    | FormatFontName

data InputEvent gtr s cp pd sp sip ab st tx = InputEvent
    { _inputEvent_data                     :: Maybe Text
    , _inputEvent_dataTransfer             :: Maybe (DataTransfer ab st tx)
    , _inputEvent_inputType                :: Maybe InputType
    , _inputEvent_isComposing              :: Maybe Bool
    , _inputEvent_getTargetRanges          :: Maybe gtr
    -- from UIEvent
    , _inputEvent_detail                   :: Maybe Int
    -- from Event
    , _inputEvent_bubbles                  :: Maybe Bool
    , _inputEvent_cancelBubble             :: Maybe Bool
    , _inputEvent_cancelable               :: Maybe Bool
    , _inputEvent_composed                 :: Maybe Bool
    , _inputEvent_currentTarget            :: Maybe s
    , _inputEvent_deepPath                 :: Maybe [s]
    , _inputEvent_defaultPrevented         :: Maybe Bool
    , _inputEvent_eventPhase               :: Maybe Int
    , _inputEvent_explicitOriginalTarget   :: Maybe s
    , _inputEvent_originalTarget           :: Maybe s
    , _inputEvent_returnValue              :: Maybe Bool
    , _inputEvent_srcElement               :: Maybe s
    , _inputEvent_target                   :: Maybe s
    , _inputEvent_timeStamp                :: Maybe Int
    , _inputEvent_type                     :: Maybe Text
    , _inputEvent_isTrusted                :: Maybe Bool
    , _inputEvent_scoped                   :: Maybe Bool
    , _inputEvent_composedPath             :: Maybe cp
    , _inputEvent_preventDefault           :: Maybe pd
    , _inputEvent_stopPropagation          :: Maybe sp
    , _inputEvent_stopImmediatePropagation :: Maybe sip
    }

data KeyboardEvent gms s cp pd sp sip = KeyboardEvent
    { _keyboardEvent_altKey                   :: Maybe Bool
    , _keyboardEvent_code                     :: Maybe Text
    , _keyboardEvent_ctrlKey                  :: Maybe Bool
    , _keyboardEvent_isComposing              :: Maybe Bool
    , _keyboardEvent_key                      :: Maybe String
    , _keyboardEvent_locale                   :: Maybe String
    , _keyboardEvent_location                 :: Maybe Int
    , _keyboardEvent_metaKey                  :: Maybe Bool
    , _keyboardEvent_repeat                   :: Maybe Bool
    , _keyboardEvent_shiftKey                 :: Maybe Bool
    , _keyboardEvent_getModifierState         :: Maybe gms
    -- from UIEvent
    , _keyboardEvent_detail                   :: Maybe Int
    -- from Event
    , _keyboardEvent_bubbles                  :: Maybe Bool
    , _keyboardEvent_cancelBubble             :: Maybe Bool
    , _keyboardEvent_cancelable               :: Maybe Bool
    , _keyboardEvent_composed                 :: Maybe Bool
    , _keyboardEvent_currentTarget            :: Maybe s
    , _keyboardEvent_deepPath                 :: Maybe [s]
    , _keyboardEvent_defaultPrevented         :: Maybe Bool
    , _keyboardEvent_eventPhase               :: Maybe Int
    , _keyboardEvent_explicitOriginalTarget   :: Maybe s
    , _keyboardEvent_originalTarget           :: Maybe s
    , _keyboardEvent_returnValue              :: Maybe Bool
    , _keyboardEvent_srcElement               :: Maybe s
    , _keyboardEvent_target                   :: Maybe s
    , _keyboardEvent_timeStamp                :: Maybe Int
    , _keyboardEvent_type                     :: Maybe Text
    , _keyboardEvent_isTrusted                :: Maybe Bool
    , _keyboardEvent_scoped                   :: Maybe Bool
    , _keyboardEvent_composedPath             :: Maybe cp
    , _keyboardEvent_preventDefault           :: Maybe pd
    , _keyboardEvent_stopPropagation          :: Maybe sp
    , _keyboardEvent_stopImmediatePropagation :: Maybe sip
    }

data MouseEvent gms s cp pd sp sip = MouseEvent
    { 
    -- from MouseEvent
    _mouseEvent_altKey                   :: Maybe Bool
    , _mouseEvent_button                   :: Maybe Int
    , _mouseEvent_buttons                  :: Maybe [Int]
    , _mouseEvent_clientX                  :: Maybe Int
    , _mouseEvent_clientY                  :: Maybe Int
    , _mouseEvent_ctrlKey                  :: Maybe Bool
    , _mouseEvent_metaKey                  :: Maybe Bool
    , _mouseEvent_movementX                :: Maybe Int
    , _mouseEvent_movementY                :: Maybe Int
    , _mouseEvent_offsetX                  :: Maybe Int
    , _mouseEvent_offsetY                  :: Maybe Int
    , _mouseEvent_pageX                    :: Maybe Int
    , _mouseEvent_pageY                    :: Maybe Int
    , _mouseEvent_region                   :: Maybe Text
    , _mouseEvent_relatedTarget            :: Maybe s
    , _mouseEvent_screenX                  :: Maybe Int
    , _mouseEvent_screenY                  :: Maybe Int
    , _mouseEvent_shiftKey                 :: Maybe Bool
    , _mouseEvent_which                    :: Maybe Int
    , _mouseEvent_getModifierState         :: Maybe gms
    -- from UIEvent
    , _mouseEvent_detail                   :: Maybe Int
    -- from Event
    , _mouseEvent_bubbles                  :: Maybe Bool
    , _mouseEvent_cancelBubble             :: Maybe Bool
    , _mouseEvent_cancelable               :: Maybe Bool
    , _mouseEvent_composed                 :: Maybe Bool
    , _mouseEvent_currentTarget            :: Maybe s
    , _mouseEvent_deepPath                 :: Maybe [s]
    , _mouseEvent_defaultPrevented         :: Maybe Bool
    , _mouseEvent_eventPhase               :: Maybe Int
    , _mouseEvent_explicitOriginalTarget   :: Maybe s
    , _mouseEvent_originalTarget           :: Maybe s
    , _mouseEvent_returnValue              :: Maybe Bool
    , _mouseEvent_srcElement               :: Maybe s
    , _mouseEvent_target                   :: Maybe s
    , _mouseEvent_timeStamp                :: Maybe Int
    , _mouseEvent_type                     :: Maybe Text
    , _mouseEvent_isTrusted                :: Maybe Bool
    , _mouseEvent_scoped                   :: Maybe Bool
    , _mouseEvent_composedPath             :: Maybe cp
    , _mouseEvent_preventDefault           :: Maybe pd
    , _mouseEvent_stopPropagation          :: Maybe sp
    , _mouseEvent_stopImmediatePropagation :: Maybe sip
    }

data PageTransitionEvent s cp pd sp sip = PageTransitionEvent
    { _pageTransitionEvent_persisted                :: Maybe Bool
    -- from Event
    , _pageTransitionEvent_bubbles                  :: Maybe Bool
    , _pageTransitionEvent_cancelBubble             :: Maybe Bool
    , _pageTransitionEvent_cancelable               :: Maybe Bool
    , _pageTransitionEvent_composed                 :: Maybe Bool
    , _pageTransitionEvent_currentTarget            :: Maybe s
    , _pageTransitionEvent_deepPath                 :: Maybe [s]
    , _pageTransitionEvent_defaultPrevented         :: Maybe Bool
    , _pageTransitionEvent_eventPhase               :: Maybe Int
    , _pageTransitionEvent_explicitOriginalTarget   :: Maybe s
    , _pageTransitionEvent_originalTarget           :: Maybe s
    , _pageTransitionEvent_returnValue              :: Maybe Bool
    , _pageTransitionEvent_srcElement               :: Maybe s
    , _pageTransitionEvent_target                   :: Maybe s
    , _pageTransitionEvent_timeStamp                :: Maybe Int
    , _pageTransitionEvent_type                     :: Maybe Text
    , _pageTransitionEvent_isTrusted                :: Maybe Bool
    , _pageTransitionEvent_scoped                   :: Maybe Bool
    , _pageTransitionEvent_composedPath             :: Maybe cp
    , _pageTransitionEvent_preventDefault           :: Maybe pd
    , _pageTransitionEvent_stopPropagation          :: Maybe sp
    , _pageTransitionEvent_stopImmediatePropagation :: Maybe sip
    }

data PointerEvent gms s cp pd sp sip = PointerEvent
    { _pointerEvent_pointerId                :: Maybe Int
    , _pointerEvent_width                    :: Maybe Int
    , _pointerEvent_height                   :: Maybe Int
    , _pointerEvent_pressure                 :: Maybe Double
    , _pointerEvent_tangentialPressure       :: Maybe Double
    , _pointerEvent_tiltX                    :: Maybe Double
    , _pointerEvent_tiltY                    :: Maybe Double
    , _pointerEvent_twist                    :: Maybe Double
    , _pointerEvent_pointerType              :: Maybe Text
    , _pointerEvent_isPrimary                :: Maybe Bool
    -- from MouseEvent
    , _pointerEvent_altKey                   :: Maybe Bool
    , _pointerEvent_button                   :: Maybe Int
    , _pointerEvent_buttons                  :: Maybe [Int]
    , _pointerEvent_clientX                  :: Maybe Int
    , _pointerEvent_clientY                  :: Maybe Int
    , _pointerEvent_ctrlKey                  :: Maybe Bool
    , _pointerEvent_metaKey                  :: Maybe Bool
    , _pointerEvent_movementX                :: Maybe Int
    , _pointerEvent_movementY                :: Maybe Int
    , _pointerEvent_offsetX                  :: Maybe Int
    , _pointerEvent_offsetY                  :: Maybe Int
    , _pointerEvent_pageX                    :: Maybe Int
    , _pointerEvent_pageY                    :: Maybe Int
    , _pointerEvent_region                   :: Maybe Text
    , _pointerEvent_relatedTarget            :: Maybe s
    , _pointerEvent_screenX                  :: Maybe Int
    , _pointerEvent_screenY                  :: Maybe Int
    , _pointerEvent_shiftKey                 :: Maybe Bool
    , _pointerEvent_which                    :: Maybe Int
    , _pointerEvent_getModifierState         :: Maybe gms
    -- from UIEvent
    , _pointerEvent_detail                   :: Maybe Int
    -- from Event
    , _pointerEvent_bubbles                  :: Maybe Bool
    , _pointerEvent_cancelBubble             :: Maybe Bool
    , _pointerEvent_cancelable               :: Maybe Bool
    , _pointerEvent_composed                 :: Maybe Bool
    , _pointerEvent_currentTarget            :: Maybe s
    , _pointerEvent_deepPath                 :: Maybe [s]
    , _pointerEvent_defaultPrevented         :: Maybe Bool
    , _pointerEvent_eventPhase               :: Maybe Int
    , _pointerEvent_explicitOriginalTarget   :: Maybe s
    , _pointerEvent_originalTarget           :: Maybe s
    , _pointerEvent_returnValue              :: Maybe Bool
    , _pointerEvent_srcElement               :: Maybe s
    , _pointerEvent_target                   :: Maybe s
    , _pointerEvent_timeStamp                :: Maybe Int
    , _pointerEvent_type                     :: Maybe Text
    , _pointerEvent_isTrusted                :: Maybe Bool
    , _pointerEvent_scoped                   :: Maybe Bool
    , _pointerEvent_composedPath             :: Maybe cp
    , _pointerEvent_preventDefault           :: Maybe pd
    , _pointerEvent_stopPropagation          :: Maybe sp
    , _pointerEvent_stopImmediatePropagation :: Maybe sip
    }

data ProgressEvent s cp pd sp sip = ProgressEvent
    { _progressEvent_lengthComputable         :: Maybe Bool
    , _progressEvent_loaded                   :: Maybe Int
    , _progressEvent_total                    :: Maybe Int
    -- from Event
    , _progressEvent_bubbles                  :: Maybe Bool
    , _progressEvent_cancelBubble             :: Maybe Bool
    , _progressEvent_cancelable               :: Maybe Bool
    , _progressEvent_composed                 :: Maybe Bool
    , _progressEvent_currentTarget            :: Maybe s
    , _progressEvent_deepPath                 :: Maybe [s]
    , _progressEvent_defaultPrevented         :: Maybe Bool
    , _progressEvent_eventPhase               :: Maybe Int
    , _progressEvent_explicitOriginalTarget   :: Maybe s
    , _progressEvent_originalTarget           :: Maybe s
    , _progressEvent_returnValue              :: Maybe Bool
    , _progressEvent_srcElement               :: Maybe s
    , _progressEvent_target                   :: Maybe s
    , _progressEvent_timeStamp                :: Maybe Int
    , _progressEvent_type                     :: Maybe Text
    , _progressEvent_isTrusted                :: Maybe Bool
    , _progressEvent_scoped                   :: Maybe Bool
    , _progressEvent_composedPath             :: Maybe cp
    , _progressEvent_preventDefault           :: Maybe pd
    , _progressEvent_stopPropagation          :: Maybe sp
    , _progressEvent_stopImmediatePropagation :: Maybe sip
    }

data SVGEvent s cp pd sp sip = SVGEvent
    { _svgEvent_bubbles                  :: Maybe Bool
    , _svgEvent_cancelBubble             :: Maybe Bool
    , _svgEvent_cancelable               :: Maybe Bool
    , _svgEvent_composed                 :: Maybe Bool
    , _svgEvent_currentTarget            :: Maybe s
    , _svgEvent_deepPath                 :: Maybe [s]
    , _svgEvent_defaultPrevented         :: Maybe Bool
    , _svgEvent_eventPhase               :: Maybe Int
    , _svgEvent_explicitOriginalTarget   :: Maybe s
    , _svgEvent_originalTarget           :: Maybe s
    , _svgEvent_returnValue              :: Maybe Bool
    , _svgEvent_srcElement               :: Maybe s
    , _svgEvent_target                   :: Maybe s
    , _svgEvent_timeStamp                :: Maybe Int
    , _svgEvent_type                     :: Maybe Text
    , _svgEvent_isTrusted                :: Maybe Bool
    , _svgEvent_scoped                   :: Maybe Bool
    , _svgEvent_composedPath             :: Maybe cp
    , _svgEvent_preventDefault           :: Maybe pd
    , _svgEvent_stopPropagation          :: Maybe sp
    , _svgEvent_stopImmediatePropagation :: Maybe sip
    }

data Touch s = Touch
    { _touch_identifier    :: Int
    , _touch_screenX       :: Int
    , _touch_screenY       :: Int
    , _touch_clientX       :: Int
    , _touch_clientY       :: Int
    , _touch_pageX         :: Int
    , _touch_pageY         :: Int
    , _touch_target        :: s
    , _touch_radiusX       :: Int
    , _touch_radiusY       :: Int
    , _touch_rotationAngle :: Double
    , _touch_force         :: Double
    }

data TouchEvent s cp pd sp sip = TouchEvent
    { _touchEvent_altKey                   :: Maybe Bool
    , _touchEvent_changedTouches           :: Maybe [Touch s]
    , _touchEvent_ctrlKey                  :: Maybe Bool
    , _touchEvent_metaKey                  :: Maybe Bool
    , _touchEvent_shiftKey                 :: Maybe Bool
    , _touchEvent_targetTouches            :: Maybe [Touch s]
    , _touchEvent_touches                  :: Maybe [Touch s]
    -- from UIEvent
    , _touchEvent_detail                   :: Maybe Int
    -- from Event
    , _touchEvent_bubbles                  :: Maybe Bool
    , _touchEvent_cancelBubble             :: Maybe Bool
    , _touchEvent_cancelable               :: Maybe Bool
    , _touchEvent_composed                 :: Maybe Bool
    , _touchEvent_currentTarget            :: Maybe s
    , _touchEvent_deepPath                 :: Maybe [s]
    , _touchEvent_defaultPrevented         :: Maybe Bool
    , _touchEvent_eventPhase               :: Maybe Int
    , _touchEvent_explicitOriginalTarget   :: Maybe s
    , _touchEvent_originalTarget           :: Maybe s
    , _touchEvent_returnValue              :: Maybe Bool
    , _touchEvent_srcElement               :: Maybe s
    , _touchEvent_target                   :: Maybe s
    , _touchEvent_timeStamp                :: Maybe Int
    , _touchEvent_type                     :: Maybe Text
    , _touchEvent_isTrusted                :: Maybe Bool
    , _touchEvent_scoped                   :: Maybe Bool
    , _touchEvent_composedPath             :: Maybe cp
    , _touchEvent_preventDefault           :: Maybe pd
    , _touchEvent_stopPropagation          :: Maybe sp
    , _touchEvent_stopImmediatePropagation :: Maybe sip
    }

data TextTrackCue = TextTrackCue
    { _textTrackCue_track       :: Track
    , _textTrackCue_id          :: String
    , _textTrackCue_startTime   :: Double
    , _textTrackCue_endTime     :: Double
    , _textTrackCue_pauseOnExit :: Bool
    }

-- todo: implement source buffer
data Track = AudioTrack
    { _audioTrack_enabled  :: Bool
    , _audioTrack_id       :: Text
    , _audioTrack_kind     :: Text
    , _audioTrack_label    :: Text
    , _audioTrack_language :: Text
    }
    | VideoTrack
    { _videoTrack_selected :: Bool
    , _videoTrack_id       :: Text
    , _videoTrack_kind     :: Text
    , _videoTrack_label    :: Text
    , _videoTrack_language :: Text
    }
    | TextTrack
    { _textTrack_activeCues                      :: [TextTrackCue]
    , _textTrack_cues                            :: [TextTrackCue]
    , _textTrack_id                              :: Text
    , _textTrack_inBandMetadataTrackDispatchType :: Text
    , _textTrack_kind                            :: Text
    , _textTrack_label                           :: Text
    , _textTrack_language                        :: Text
    , _textTrack_mode                            :: Text
    }

data TrackEvent s cp pd sp sip = TrackEvent
    { _trackEvent_track                    :: Maybe Track
    -- from Event
    , _trackEvent_bubbles                  :: Maybe Bool
    , _trackEvent_cancelBubble             :: Maybe Bool
    , _trackEvent_cancelable               :: Maybe Bool
    , _trackEvent_composed                 :: Maybe Bool
    , _trackEvent_currentTarget            :: Maybe s
    , _trackEvent_deepPath                 :: Maybe [s]
    , _trackEvent_defaultPrevented         :: Maybe Bool
    , _trackEvent_eventPhase               :: Maybe Int
    , _trackEvent_explicitOriginalTarget   :: Maybe s
    , _trackEvent_originalTarget           :: Maybe s
    , _trackEvent_returnValue              :: Maybe Bool
    , _trackEvent_srcElement               :: Maybe s
    , _trackEvent_target                   :: Maybe s
    , _trackEvent_timeStamp                :: Maybe Int
    , _trackEvent_type                     :: Maybe Text
    , _trackEvent_isTrusted                :: Maybe Bool
    , _trackEvent_scoped                   :: Maybe Bool
    , _trackEvent_composedPath             :: Maybe cp
    , _trackEvent_preventDefault           :: Maybe pd
    , _trackEvent_stopPropagation          :: Maybe sp
    , _trackEvent_stopImmediatePropagation :: Maybe sip
    }

