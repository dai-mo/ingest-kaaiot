/*
 * Copyright (c) 2017-2018 brewlabs SAS
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

package org.dcs.iot.kaa

import org.dcs.commons.error.{ErrorConstants, HttpErrorResponse}
import org.dcs.commons.ws.ApiConfig

/**
  *
  * @author cmathew
  * @constructor
  */
trait KaaApiConfig extends ApiConfig {

  override def error(status: Int, message: String): HttpErrorResponse = (status match {
      case 400 => ErrorConstants.DCS301
      case 401 => ErrorConstants.DCS302
      case 403 => ErrorConstants.DCS303
      case 404 => ErrorConstants.DCS304
      case 409 => ErrorConstants.DCS305
      case _ => {
        val er = ErrorConstants.DCS001
        er.withDescription(message)
        er
      }
    }).http(status)
}
